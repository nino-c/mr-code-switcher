
var seed =
{
    "y":{"type":"number","value":1,"varname":"y"},
    "y^2":{"type":"number","value":2,"varname":"y2"},
    "y^3":{"type":"number","value":3,"varname":"y3"},
    "y^4":{"type":"number","value":-2,"varname":"y4"},
    "y^5":{"type":"number","value":5,"varname":"y5"},
    "x":{"type":"number","value":1,"varname":"x"},
    "xy":{"type":"number","value":1,"varname":"xy"},
    "xy^2":{"type":"number","value":0,"varname":"xy2"},
    "xy^3":{"type":"number","value":7,"varname":"xy3"},
    "xy^4":{"type":"number","value":1,"varname":"xy4"},
    "x^2":{"type":"number","value":0,"varname":"x2"},
    "x^2y":{"type":"number","value":1,"varname":"x2y"},
    "x^2y^2":{"type":"number","value":-13,"varname":"x2y2"},
    "x^2y^3":{"type":"number","value":1,"varname":"x2y3"},
    "x^3":{"type":"number","value":1,"varname":"x3"},
    "x^3y":{"type":"number","value":1,"varname":"x3y"},
    "x^3y^2":{"type":"number","value":1,"varname":"x3y2"},
    "x^4":{"type":"number","value":1,"varname":"x4"},
    "x^4y":{"type":"number","value":1,"varname":"x4y"},
    "x^5":{"type":"number","value":1,"varname":"x5"}
}

var seed =
{
    "Math.pow(y, 1)":{"type":"number","value":1,"varname":"y"},
    "Math.pow(y, 2)":{"type":"number","value":2,"varname":"y2"},
    "Math.pow(y, 3)":{"type":"number","value":3,"varname":"y3"},
    "Math.pow(y, 4)":{"type":"number","value":-2,"varname":"y4"},
    "Math.pow(y, 5)":{"type":"number","value":5,"varname":"y5"},
    "Math.pow(x, 1)":{"type":"number","value":1,"varname":"x"},
    "Math.pow(x, 1) * Math.pow(y, 1)":{"type":"number","value":1,"varname":"xy"},
    "Math.pow(x, 1) * Math.pow(y, 2)":{"type":"number","value":0,"varname":"xy2"},
    "Math.pow(x, 1) * Math.pow(y, 3)":{"type":"number","value":7,"varname":"xy3"},
    "Math.pow(x, 1) * Math.pow(y, 4)":{"type":"number","value":1,"varname":"xy4"},
    "Math.pow(x, 2)":{"type":"number","value":0,"varname":"x2"},
    "Math.pow(x, 2) * Math.pow(y, 1)":{"type":"number","value":1,"varname":"x2y"},
    "Math.pow(x, 2) * Math.pow(y, 2)":{"type":"number","value":-13,"varname":"x2y2"},
    "Math.pow(x, 2) * Math.pow(y, 3)":{"type":"number","value":1,"varname":"x2y3"},
    "Math.pow(x, 3)":{"type":"number","value":1,"varname":"x3"},
    "Math.pow(x, 3) * Math.pow(y, 1)":{"type":"number","value":1,"varname":"x3y"},
    "Math.pow(x, 3) * Math.pow(y, 2)":{"type":"number","value":1,"varname":"x3y2"},
    "Math.pow(x, 4)^1":{"type":"number","value":1,"varname":"x4"},
    "Math.pow(x, 4) * Math.pow(y, 1)":{"type":"number","value":1,"varname":"x4y"},
    "Math.pow(x, 5)":{"type":"number","value":1,"varname":"x5"}
}

var summandVars = ["Math.pow(y, 1)",
 "Math.pow(y, 2)",
 "Math.pow(y, 3)",
 "Math.pow(y, 4)",
 "Math.pow(y, 5)",
 "Math.pow(x, 1)",
 "Math.pow(x, 1) * Math.pow(y, 1)",
 "Math.pow(x, 1) * Math.pow(y, 2)",
 "Math.pow(x, 1) * Math.pow(y, 3)",
 "Math.pow(x, 1) * Math.pow(y, 4)",
 "Math.pow(x, 2)",
 "Math.pow(x, 2) * Math.pow(y, 1)",
 "Math.pow(x, 2) * Math.pow(y, 2)",
 "Math.pow(x, 2) * Math.pow(y, 3)",
 "Math.pow(x, 3)",
 "Math.pow(x, 3) * Math.pow(y, 1)",
 "Math.pow(x, 3) * Math.pow(y, 2)",
 "Math.pow(x, 4)^1",
 "Math.pow(x, 4) * Math.pow(y, 1)",
 "Math.pow(x, 5)"];

var coeffs = _.map(_.pairs(seed), function(pair) {
    return pair[1].value;
})


var regex1 = /([a-z])\^([0-9])/;
var regex2 = /(Math\.pow\([^\)]+\))(Math\.pow\([^\)]+\))/;

var coeffs = _.mapObject(seed, function(val,key) {
    return val.value;
});

var polynomial_string = _.reduce(
    _.filter(_.map(_.pairs(coeffs), function(coeff) {
        var s = coeff[1] == 1 ? coeff[0].toString() :
			coeff[1].toString()+coeff[0];
        if (coeff[1] == 0) s = '';
        return s;
    }), function(x) {
        return x != '';
    }), function(a,b) {
        var r = a;
        var bnum = parseInt(b.replace(/[^0-9\-]*/, '')) || 1;
        r += (bnum > 0 ? '+'+b : b);
        return r;
    }, '');

_.map(coeffs, function(coeff) {
    //return 'Math.pow(x)
})
//var polynomial_javascript =

if (polynomial_string.substr(0,1) == '+') {
    polynomial_string = polynomial_string.substr(1, polynomial_string.length);
}

CartesianMatrix = new Matrix(1,0,0,-1, view.center.x, view.center.y);

DARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);
LIGHT_GREY = new Color(0.7, 0.7, 0.7, 0.4);

x_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });
x_axis.add(new Point(-view.size.width/2, 0));
x_axis.add(new Point(view.size.width/2, 0));
x_axis.closed = true;
//project.activeLayer.insertChild(0,x_axis)

y_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });
y_axis.add(new Point(0, -view.size.height/2));
y_axis.add(new Point(0, view.size.height/2));

x_lines = [];
_.each(_.range(-10,10), function(n) {
    line = new Path({strokeColor: LIGHT_GREY });
    line.add( new Point(n, view.size.height/2) );
    line.add( new Point(n, -view.size.height/2) );
    line.closed = true;
    //project.activeLayer.insertChild(0, line);
    x_lines.push( line );
});

y_lines = [];
_.each(_.range(-10,10), function(n) {
    line = new Path({strokeColor: LIGHT_GREY });
    line.add( new Point(view.size.width/2, n) );
    line.add( new Point(-view.size.width/2, n) );
    line.closed = true;
    //project.activeLayer.insertChild(0, line);
    y_lines.push( line );
});

function trans(lay, scale) {
    if (scale === undefined) scale = 1;
    lay.transform( new Matrix((view.size.width * scale),0,0,(view.size.height * -scale),
        view.center.x, view.center.y) );
}

trans(project.activeLayer, 0.1);

// define formal mathematical function
MFunction = function(func, extrema) {
    //console.log(func.length);
    this.func = func;
    if (!extrema) { extrema = [-5,5]; }

    this.domain = {
        elements: [],
        min: (extrema[0] || -5),
        max: (extrema[1] || 5)
    };

    this.codomain = {
        elements: [],
        min: null,
        max: null
    };

    this.mapping = null;
}

MFunction.prototype = {

    compute: function(delta) {
        if (!delta) { delta = 50; }
        this.domain.elements = numeric.linspace(this.domain.min, this.domain.max, delta);
        this.codomain.elements = _.map(this.domain.elements, this.func);
        this.codomain.min = _.min(this.codomain.elements);
        this.codomain.max = _.max(this.codomain.elements);
        this.mapping = _.zip(this.domain.elements, this.codomain.elements);

        this._w = Math.abs(this.domain.max - this.domain.min);
        this._h = _.max(  [Math.abs(this.codomain.max),  Math.abs(this.codomain.min)]  );

        this.transformation_matrix = new Matrix(
            (view.size.width / this._w), 0,
            0, (view.size.height / (-1*this._h)),
            view.center.x, view.center.y);

        this.computed = true;
    },

    // "flattens" mapping
    // i.e. [[1,2],3] -> [1,2,3]
    getPoints: function() {
        if (!this.computed) { this.compute(); }
        this.points = _.map(this.mapping, function(pair) {
            return _.flatten(pair);
        });
        return this.points;
    },


    draw: function(path, matrix_premult, map3d, tmatrix) {

        if (!this.computed) { this.compute(); }

        if (map3d) {
            this.points = this.points3d;
        } else {
            this.points = this.getPoints();
        }

        if (matrix_premult) {
            this.points = _.map(this.points, function(p) {
                return numeric.dot(matrix_premult, p);
            })
        }

        _.each(this.points, function(p) {
            path.add(new Point(p));
        })

        path.add(new Point(this.domain.max*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));
        path.add(new Point(this.domain.min*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));
        path.closed = true;

        if (tmatrix) {
            path.transform(tmatrix);
        } else {
            path.transform(this.transformation_matrix);
        }
    }
}



function getPolynomialFunction(coeffs) {
    return _.reduce(_.mapObject(seed, function(value, key) {
        return value.value.toString() + '*' + key.toString()
    }), function(a,b) {
        return a+'+'+b;
    });
}

var PolynomialObj = {
    javascript: getPolynomialFunction(coeffs)
};

//
// $.post("/symbolic_math/latex/", {
//     expressionString: polynomial_string
// }, function(data) {
//
//     PolynomialObj = data;
//     startRendering();
//
//   	tokens = PolynomialObj.latex.split(" ");
// 	line_length = Math.ceil(tokens.length/2);
// 	line2 = tokens.splice(-1*line_length).join(" ");
// 	line1 = tokens.join(" ");
//
// 	try {
//       var text = [
// 		'Polynomial Surface:<br />',
// 		"$f(x,y) = " + line1 + "\\\\\n\\space \\space \\space \\space "
//             + line2 + "$",
// 		//'<div style="margin-top: 15px;">Projection Matrix:</div>',
//         //"$\\left(\\begin{array}{rrr}1 & 0 & \\frac{1}{2}\\sqrt{2}\\\\\n 0 & 1 & \\frac{1}{2}\\sqrt{2}\\end{array}\\right)$"];
// 		];
//       var css = {"font-size":"11px", "color:":"#888888", "background-color": "rgba(230,230,230,0.7)"};
//       window.featureDisplay(text, css);
//     } catch (e) { console.log(e); }
//
// });

var Polynomial = function(x,y) {
    eval("var r = " + getPolynomialFunction + ";");
    return r;
}

var polynomial_degree = 5;
var zindex = undefined;



function startRendering() {

    slices = [];
    zrange = [-15,0];
    xrange = [-9, 9];
    zspace = numeric.linspace(zrange[0], zrange[1], 50);

    F0 = function(x) { return Polynomial(coeffs, x,0); }
    slice0 = new MFunction(F0, [xrange[0],xrange[1]]);
    slice0.compute();
    global_matrix = slice0.transformation_matrix;

    GraphLayer = new Layer();
    function_shown = false;
    zindex = 0;

}

var drawing = true;
var animating = false;
var animationFrame = 0;

view.onFrame = function(event) {

    if (drawing && zindex != undefined && zindex < zspace.length) {

        z = zspace[zindex];

        F = function(x) { return Polynomial(x,z); }
        slice = new MFunction(F, [xrange[0],xrange[1]]);
        points3d = slice.getPoints();
        _.each(_.range(points3d.length), function(i) { points3d[i].push(z); });

        slice.points3d = points3d

        path1 = new Path({
            strokeColor: new Color(0.3, 0.3, 0.3, 0.35),
            strokeWidth: 1,
            closed: true,
            fillColor: new Color(Math.random(),1,Math.random(),0.2),
        });

        slice.draw(path1, null, true, global_matrix);
        path1.scale(1-(z/50), 1-(z/50), view.center)
        path1.translate(new Point(-10*z, 30*z))
        project.activeLayer.insertChild(0,path1);

        zindex++;

    } else {
	 	if (zindex && drawing) {
		  	drawing = false;
            animating = true;
		}
	}

    if (animating) {

        var children = project.activeLayer.children;
        console.log(children);

    }

}

startRendering();
