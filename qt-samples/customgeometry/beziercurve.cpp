/****************************************************************************
**
** Copyright (C) 2014 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the demonstration applications of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL21$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia. For licensing terms and
** conditions see http://qt.digia.com/licensing. For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 or version 3 as published by the Free
** Software Foundation and appearing in the file LICENSE.LGPLv21 and
** LICENSE.LGPLv3 included in the packaging of this file. Please review the
** following information to ensure the GNU Lesser General Public License
** requirements will be met: https://www.gnu.org/licenses/lgpl.html and
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights. These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include "beziercurve.h"

#include <QtQuick/qsgnode.h>
#include <QtQuick/qsgflatcolormaterial.h>
#include <private/qtriangulator_p.h>

//! [1]
BezierCurve::BezierCurve(QQuickItem *parent)
    : QQuickItem(parent)
    , m_p1(0, 0)
    , m_p2(1, 0)
    , m_p3(0, 1)
    , m_p4(1, 1)
    , m_segmentCount(32)
{
    setFlag(ItemHasContents, true);
}
//! [1]

//! [2]
BezierCurve::~BezierCurve()
{
}
//! [2]

//! [3]
void BezierCurve::setP1(const QPointF &p)
{
    if (p == m_p1)
        return;

    m_p1 = p;
    emit p1Changed(p);
    update();
}
//! [3]

void BezierCurve::setP2(const QPointF &p)
{
    if (p == m_p2)
        return;

    m_p2 = p;
    emit p2Changed(p);
    update();
}

void BezierCurve::setP3(const QPointF &p)
{
    if (p == m_p3)
        return;

    m_p3 = p;
    emit p3Changed(p);
    update();
}

void BezierCurve::setP4(const QPointF &p)
{
    if (p == m_p4)
        return;

    m_p4 = p;
    emit p4Changed(p);
    update();
}

void BezierCurve::setSegmentCount(int count)
{
    if (m_segmentCount == count)
        return;

    m_segmentCount = count;
    emit segmentCountChanged(count);
    update();
}

//! [4]
QSGNode *BezierCurve::updatePaintNode(QSGNode *oldNode, UpdatePaintNodeData *)
{
    QSGGeometryNode *node = 0;
    QSGGeometry *geometry = 0;

    if (!oldNode) {
        node = new QSGGeometryNode;
//! [4] //! [5]
        geometry = new QSGGeometry{QSGGeometry::defaultAttributes_Point2D(), 0, 0, GL_UNSIGNED_INT};
        geometry->setDrawingMode(GL_TRIANGLES);
        node->setGeometry(geometry);
        node->setFlag(QSGNode::OwnsGeometry);
//! [5] //! [6]
        QSGFlatColorMaterial *material = new QSGFlatColorMaterial;
        material->setColor(QColor(255, 0, 0));
        node->setMaterial(material);
        node->setFlag(QSGNode::OwnsMaterial);
//! [6] //! [7]
    } else {
        node = static_cast<QSGGeometryNode *>(oldNode);
        geometry = node->geometry();
    }
//! [7]

//! [8]
    const QRectF bounds{boundingRect()};
    const QPointF c1 {bounds.x() + bounds.width() * m_p2.x(), bounds.y() + bounds.height() * m_p2.y()};
    const QPointF c2 {bounds.x() + bounds.width() * m_p3.x(), bounds.y() + bounds.height() * m_p3.y()};

    QPainterPath path;
    path.moveTo(bounds.topLeft());
    path.cubicTo(c1, c2, bounds.bottomRight());

    // Stroke path
    QPainterPathStroker stroker;
    stroker.setCapStyle(Qt::SquareCap);
    stroker.setJoinStyle(Qt::RoundJoin);
    stroker.setWidth(2.0f);
    stroker.setDashPattern(QVector<qreal>() << 5 << 5);

    // Generate triangles
    const QPainterPath strokedPath {stroker.createStroke(path)};
    const QTriangleSet triangles {qTriangulate(strokedPath)};

    // Fill vertex buffer
    geometry->allocate(triangles.vertices.size() / 2, triangles.indices.size());
    QSGGeometry::Point2D *vertex = geometry->vertexDataAsPoint2D();
    for (int i = 0; i < geometry->vertexCount(); ++i)
        vertex[i].set(triangles.vertices.at(2 * i), triangles.vertices.at(2 * i + 1));

    // Fill index buffer
    uint *indices = geometry->indexDataAsUInt();
    if (triangles.indices.type() != QVertexIndexVector::UnsignedInt)
        qFatal("Unexpected geometry index type");
    memcpy(indices, triangles.indices.data(), triangles.indices.size() * sizeof(*indices));

    node->markDirty(QSGNode::DirtyGeometry);
//! [8]


//! [9]
    return node;
}
//! [9]

