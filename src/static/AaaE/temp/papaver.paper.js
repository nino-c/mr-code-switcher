///var Canvas = view._context.canvas;
//view.viewSize = new Size(Canvas.width, Canvas.height);

// var _width = view.size.width;
// var _height = view.size.height;

var speed_coefficient = 1;
var rx = 2; var ry = 2;

DARK_GREY = new Color(0.6, 0.6, 0.6, 0.5);
LIGHT_GREY = new Color(0.7, 0.7, 0.7, 0.7);

if (!speed_coefficient) speed_coefficient = 1;

var cartesian_matrix = new Matrix(5,0,0,-5, view.center.x, view.center.y);


var lines = [];

_.each(_.range(-10,11), function(i) {

	var path1 = new Path({
		strokeWidth: 1,
		strokeColor: DARK_GREY
	});
	var points1 = _.map(_.range(-10,11), function(p) {
		return new Point(p*10,i*10);
	});
	_.each(points1, function(p) {
		path1.add(p);
	})
	lines.push(path1);

})

_.each(_.range(-10,11), function(i) {

	var path2 = new Path({
		strokeWidth: 1,
		strokeColor: DARK_GREY
	});
	var points2 = _.map(_.range(-10,11), function(p) {
		return new Point(i*10,p*10);
	});
	_.each(points2, function(p) {
		path2.add(p);
	})
	lines.push(path2);

})


project.activeLayer.matrix = cartesian_matrix


// connect points


// rasterize never


// var map = {
// 	string: '(x^2-i)(x+2)',
// 	transformation: function(x,y) {
// 		return new Point(Math.sin(x), - 2*Math.cos(y));
// 	}
// }


// transform all points, see if points in both sets move ok
var transformation = new Matrix(1, 0, 0, 1, 0.01, -0.1);
transformation.rotate(0.1);
transformation.scale(0.99);
console.log('trans', transformation)

var fixedpoint = (new Point(0,0)).transform(cartesian_matrix)
//var radiusOfInversion =

function applyTransform(seg,t) {
	var vec = fixedpoint - seg.point

	if (vec.length != 0) {
		vec.angle += vec.length;

		seg.point = seg.point + (vec.normalize()*Math.cos(t/10))

		//console.log(fixedpoint)
	}

	fixedpoint = (new Point(0,0) + new Point(rx*Math.cos(t), ry*Math.sin(t))).transform(cartesian_matrix);
	seg.path.smooth();
}

view.onFrame = function(e) {
	// e {delta, time, count}
	_.each(lines, function(line) {
		_.each(line.segments, function(seg) {
			applyTransform(seg, e.time / speed_coefficient)
			//console.log(map.transformation(seg.point.x, seg.point.y))
			//seg.point = map.transformation(seg.point.x, seg.point.y);
		})
	})
}
