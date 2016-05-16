
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
    "Math.pow(x, 3) * Math.pow(y, 2)":{"type":"number","value":1,"varname":"x2y"},
    //"Math.pow(x, 2)":{"type":"number","value":-20,"varname":"x2y2"},
    "Math.pow(x, 2) * Math.pow(y, 3)":{"type":"number","value":1,"varname":"x2y3"},
    "Math.pow(x, 3)":{"type":"number","value":1,"varname":"x3"},
    "Math.pow(x, 3) * Math.pow(y, 1)":{"type":"number","value":12,"varname":"x3y"},
    "Math.pow(x, 3) * Math.pow(y, 2)":{"type":"number","value":-15,"varname":"x3y2"},
    "Math.pow(x, 4)^1":{"type":"number","value":1,"varname":"x4"},
    "Math.pow(x, 4) * Math.pow(y, 1)":{"type":"number","value":1,"varname":"x4y"},
    "Math.pow(x, 5)":{"type":"number","value":1,"varname":"x5"}
}

var seed2 =
{
    "Math.pow(x, 1)":{"type":"number","value":1},
    "Math.pow(x, 2)":{"type":"number","value":-2},
    "Math.pow(x, 3)":{"type":"number","value":3},
    "Math.pow(y, 1)":{"type":"number","value":-1},
    "Math.pow(y, 2)":{"type":"number","value":2},
    "Math.pow(y, 3)*Math.pow(x, 5)":{"type":"number","value":-3},
    // "Math.pow(x, 4)":{"type":"number","value":-2},
    // "Math.pow(x, 5)":{"type":"number","value":5},

    // "Math.pow(x, 1)":{"type":"number","value":1,"varname":"x"},
    // "Math.pow(x, 1) * Math.pow(y, 1)":{"type":"number","value":1,"varname":"xy"},
    // "Math.pow(x, 1) * Math.pow(y, 2)":{"type":"number","value":0,"varname":"xy2"},
    // "Math.pow(x, 1) * Math.pow(y, 3)":{"type":"number","value":7,"varname":"xy3"},
    // "Math.pow(x, 1) * Math.pow(y, 4)":{"type":"number","value":1,"varname":"xy4"},
    // "Math.pow(x, 2)":{"type":"number","value":0,"varname":"x2"},
    // "Math.pow(x, 3) * Math.pow(y, 2)":{"type":"number","value":1,"varname":"x2y"},
    // //"Math.pow(x, 2)":{"type":"number","value":-20,"varname":"x2y2"},
    // "Math.pow(x, 2) * Math.pow(y, 3)":{"type":"number","value":1,"varname":"x2y3"},
    // "Math.pow(x, 3)":{"type":"number","value":1,"varname":"x3"},
    // "Math.pow(x, 3) * Math.pow(y, 1)":{"type":"number","value":12,"varname":"x3y"},
    // "Math.pow(x, 3) * Math.pow(y, 2)":{"type":"number","value":-15,"varname":"x3y2"},
    // "Math.pow(x, 4)^1":{"type":"number","value":1,"varname":"x4"},
    // "Math.pow(x, 4) * Math.pow(y, 1)":{"type":"number","value":1,"varname":"x4y"},
    // "Math.pow(x, 5)":{"type":"number","value":1,"varname":"x5"}
}

var horizontalExpansionCoeff = 1.2;
var primes = [2,3,5,7,11,13,17,19,23,29,31];

var regex1 = /([a-z])\^([0-9])/;
var regex2 = /(Math\.pow\([^\)]+\))(Math\.pow\([^\)]+\))/;



DARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);
LIGHT_GREY = new Color(0.85, 0.85, 0.85, 0.3);

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

GraphLayer = new Layer();

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
        if (!delta) { delta = 30; }
        this.domain.elements = numeric.linspace(this.domain.min, this.domain.max, delta);
        this.codomain.elements = _.map(this.domain.elements, this.func);
        this.codomain.min = _.min(this.codomain.elements);
        this.codomain.max = _.max(this.codomain.elements);
        this.mapping = _.zip(this.domain.elements, this.codomain.elements);

        this._w = Math.abs(this.domain.max - this.domain.min);
        this._h = _.max(  [Math.abs(this.codomain.max),  Math.abs(this.codomain.min)]  );

        this.transformation_matrix = new Matrix(
            (view.size.width / this._w)*horizontalExpansionCoeff, 0,
            0, (view.size.height / (-1*this._h)*horizontalExpansionCoeff),
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


    draw: function(path, tmatrix) {

        if (!this.computed) { this.compute(); }

        this.path = path;
        this.path.removeSegments();
        this.tmatrix = tmatrix;

        this.points.push(new Point(this.domain.max*1.5, Math.abs(this.codomain.min)*-1.7
            + Math.abs(this.codomain.max)*-1.7));
        this.points.push(new Point(this.domain.min*1.5, Math.abs(this.codomain.min)*-1.7
            + Math.abs(this.codomain.max)*-1.7));

        var self = this;
        _.each(this.points, function(p) {
            self.path.add(new Point(p));
        });

        this.path.closed = true;

        if (tmatrix)
            this.path.transform(tmatrix);
        else
            this.path.matrix = (this.transformation_matrix);

        //this.path.smooth();

    },

    project: function(z) {
        this.path.scale(1-(z/Z_DEPTH), 1-(z/Z_DEPTH), view.center)
        this.path.rotate(-2*(z%Z_DEPTH), view.center);
        this.path.translate(new Point(-5*z, 15*z))
    }

}

var coeffObj = _.mapObject(seed, function(value, key) {
    return value.value;
});

var PolynomialSurfaceSlice = function(x, y, coeffObj) {
    fn = _.reduce(_.mapObject(coeffObj, function(value, key) {
        return value.toString() + '*' + key.toString()
    }), function(a,b) {
        return a+'+'+b;
    });
    //console.log(fn);
    eval("var r = " + fn + ";");
    return r;
}


function changeCoeffs() {
    coeffObj = _.mapObject(coeffObj, function(value, key) {
        // return original_coeffs[i] * (slice0.codomain.max) * Math.cos(  animationCycle/100  )
        return originalValues[key] * Math.cos(  animationCycle/10  )
    })
}


var Z_DEPTH = 8;
xrange = [-5, 5];
zrange = [-2,-5];

var slices = [];
var sliceFunctions = [];

var alphaCoeffs = _.map(_.range(Z_DEPTH), function(z) {
    return 1-((z/Z_DEPTH)*0.6);
});

var sliceColors = _.map(_.range(Z_DEPTH), function(z) {
    clr = new Color(0.1,1,0.1,0.4*alphaCoeffs[z]);
    clr.hue += 60 * Math.sin(z);
    clr.brightness = 1 - (Math.sin(z)/2 + 1/2)/6;
    return clr;
});

var zrange_index = 0;
function drawZRange(a,b) {

    zspace = numeric.linspace(a, b, Z_DEPTH);
    zindex = 0;

    _.each(zspace, function(z) {

        var path, sliceFunction;
        if (zrange_index == 0) {
            path = new Path({
                strokeColor: new Color(0.3, 0.3, 0.3, 0.6*alphaCoeffs[zindex]),
                strokeWidth: 1,
                fillColor: sliceColors[zindex],
            });
            sliceFunction = new MFunction(function(x) {
                return PolynomialSurfaceSlice(x,z,coeffObj);
            }, [xrange[0],xrange[1]]);
            global_matrix = sliceFunction.transformation_matrix;
        } else {
            path = slices[zindex];
            sliceFunction = new MFunction(function(x) {
                return PolynomialSurfaceSlice(x,z,coeffObj);
            }, [xrange[0],xrange[1]]);
        }

        sliceFunction.z = z;
        sliceFunction.getPoints();
        sliceFunction.draw(path, global_matrix);
        sliceFunction.project(z);

        if (zrange_index == 0) {
            slices.push(path);
            sliceFunctions.push(sliceFunction);
            project.activeLayer.insertChild(0,path);
        }
        path.smooth();

        zindex++;

    })

    zrange_index++;
}

drawZRange(zrange[0], zrange[1]);

function zMove2(n) {
    //slices = [];
    //sliceFunctions = [];
    //delta = -0.01
    //console.log('del', delta);
    zrange2 = [zrange[0]-5*Math.cos(n/36), zrange[1]-5*Math.cos(n/36)];
    //console.log(zrange2);
    //project.activeLayer.removeChildren();
    drawZRange(zrange2[0], zrange2[1]);
}



function onResize(event) {
	project.activeLayer.position = view.center;
}

frameInterval = 2;
view.onFrame = function(event) {
    if (event.count % frameInterval !== 0) return;
    zMove2(event.count/frameInterval);
}
