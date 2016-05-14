
var seed =
{
    "Math.pow(y, 1)":{"type":"number","value":1,"varname":"y"},
    "Math.pow(y, 2)":{"type":"number","value":2,"varname":"y2"},
    "Math.pow(y, 3)":{"type":"number","value":3,"varname":"y3"},
    // "Math.pow(y, 4)":{"type":"number","value":-2,"varname":"y4"},
    // "Math.pow(y, 5)":{"type":"number","value":5,"varname":"y5"},
    //
    // "Math.pow(x, 1)":{"type":"number","value":1,"varname":"x"},
    // "Math.pow(x, 1) * Math.pow(y, 1)":{"type":"number","value":1,"varname":"xy"},
    // "Math.pow(x, 1) * Math.pow(y, 2)":{"type":"number","value":0,"varname":"xy2"},
    // "Math.pow(x, 1) * Math.pow(y, 3)":{"type":"number","value":7,"varname":"xy3"},
    // "Math.pow(x, 1) * Math.pow(y, 4)":{"type":"number","value":1,"varname":"xy4"},
    // "Math.pow(x, 2)":{"type":"number","value":0,"varname":"x2"},
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

var seed =
{
    //"Math.pow(y, 1)":{"type":"number","value":1,"varname":"y"},
    //"Math.pow(y, 2)":{"type":"number","value":2,"varname":"y2"},
    "Math.pow(x, 3) * Math.pow(y, 5)":{"type":"number","value":1,"varname":"x3y"},
    "Math.pow(x, 3) * Math.pow(y, 2)":{"type":"number","value":1,"varname":"x3y2"},
    "Math.pow(x, 4)^1":{"type":"number","value":1,"varname":"x4"},
    "Math.pow(x, 4) * Math.pow(y, 1)":{"type":"number","value":1,"varname":"x4y"},
    "Math.pow(x, 5)":{"type":"number","value":1,"varname":"x5"}
}

var horizontalExpansionCoeff = 1.2;
var primes = [2,3,5,7,11,13,17,19,23,29,31];

var regex1 = /([a-z])\^([0-9])/;
var regex2 = /(Math\.pow\([^\)]+\))(Math\.pow\([^\)]+\))/;

var coeffs = _.map(_.pairs(seed), function(pair) {
    //return pair[1].value;
    return (Math.random()*10)-5;
});
console.log(coeffs);

function getPolynomialFunction(coeffs) {
    return _.reduce(_.mapObject(seed, function(value, key) {
        return value.value.toString() + '*' + key.toString()
    }), function(a,b) {
        return a+'+'+b;
    });
}

//console.log(getPolynomialFunction(coeffs));s

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


    draw: function(path, matrix_premult, map3d, tmatrix) {

        if (!this.computed) { this.compute(); }


        this.path = path;
        //console.log('path1', this.path);
        this.matrix_premult = matrix_premult;
        this.map3d = map3d;
        this.tmatrix = tmatrix;

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

        _.each(this.points, function(p) { path.add(new Point(p)); });
        path.add(new Point(this.domain.max*1.2, Math.abs(this.codomain.min)*-1.3
            + Math.abs(this.codomain.max)*-1.3));
        path.add(new Point(this.domain.min*1.2, Math.abs(this.codomain.min)*-1.3
            + Math.abs(this.codomain.max)*-1.3));
        path.closed = true;

        if (tmatrix) {
            path.transform(tmatrix);
        } else {
            path.transform(this.transformation_matrix);
        }

        this.path = path;

        this.project();
        //path.smooth();
    },

    logpath: function() {
        console.log('logpath');
        //console.log(this.path);
    },

    project: function() {
        this.path.scale(1-(z/50), 1-(z/50), view.center)
        this.path.translate(new Point(-10*z, 30*z))
    },

    adjust: function(coeffs) {
        this.compute();
        this.getPoints();

        console.log(coeffs);
        console.log('this.path', this.path);

        if (this.matrix_premult) {
            this.points = _.map(this.points, function(p) {
                return numeric.dot(this.matrix_premult, p);
            })
        }

        var newPoints = [];
        _.each(this.points, function(p) {
            newPoints.push(new Point(p));
        });
        newPoints.push(new Point(this.domain.max*1.2, Math.abs(this.codomain.min)*-1.3
            + Math.abs(this.codomain.max)*-1.3));
        newPoints.push(new Point(this.domain.min*1.2, Math.abs(this.codomain.min)*-1.3
            + Math.abs(this.codomain.max)*-1.3));


        _.each(sliceFunctions, function(slice) {
            _.each(_.range(0,this.path.segments.length), function(i) {
                this.path.segments[i].point = newPoints[i];
                //this.
            })
        })

        if (this.tmatrix) {
            this.path.transform(this.tmatrix);
        } else {
            this.path.transform(this.transformation_matrix);
        }

        this.project();
        path.smooth();
    }
}



console.log(getPolynomialFunction(coeffs));

var Polynomial = function(x,y) {
    eval("var r = " + getPolynomialFunction(coeffs) + ";");
    return r;
}



xrange = [-5, 5];
zrange = [0,-4];
zspace = numeric.linspace(zrange[0], zrange[1], 15);


F0 = function(x) { return Polynomial(x,0); }
slice0 = new MFunction(F0, [xrange[0],xrange[1]]);
slice0.compute();
console.log(slice0.codomain.min, slice0.codomain.max);
global_matrix = slice0.transformation_matrix;
console.log('global_matrix', global_matrix);

GraphLayer = new Layer({
    //blendMode: 'multiply'
});

var zindex = undefined;
var drawing = true;
var animating = false;
var animationFrame = 0;
zindex = 0;

var slicePaths = [];
var sliceFunctions = [slice0];

view.onFrame = function(event) {
    if (drawing && zindex != undefined && zindex < zspace.length) {
        //console.log('drawing');
        z = zspace[zindex];

        F = function(x) { return Polynomial(x,z); }
        var slice = new MFunction(F, [xrange[0],xrange[1]]);
        sliceFunctions.push(slice);

        points3d = slice.getPoints();
        _.each(_.range(points3d.length), function(i) {
            points3d[i].push(z);
        });
        slice.points3d = points3d;

        var indexCoeff = 1-((zindex/zspace.length)*0.8);

        var path1 = new Path({
            strokeColor: new Color(0.3, 0.3, 0.3, 0.6*indexCoeff),
            strokeWidth: 1,
            closed: true,
            fillColor: new Color(Math.random(),1,Math.random(),0.4*indexCoeff),
        });
        slicePaths.push(path1);

        // projection
        slice.draw(path1, null, true, global_matrix);
        sliceFunctions.push(slice);

        obj = project.activeLayer.insertChild(0,path1);
        //console.log('insertChild obj', obj);

        zindex++;

    } else {
	 	if (zindex && drawing) {
		  	drawing = false;
            animating = true;
            animationStart = event.count;
            zindex = undefined;
		}
	}

    if (animating) {

        if (zindex === undefined) {
            // change coefficients and reset zindex

            animationCount = animationStart - event.count;
            console.log('animation cycle @ ' + animationCount.toString());
            //console.log('sliceFunctions', sliceFunctions);

            coeffs = _.map(_.range(0,coeffs.length), function(i) {
                return coeffs[i] * Math.cos(primes[i] * (animationCount+1) * 0.05)
            })
            //console.log('new-coeffs', coeffs);
            zindex = 0;
        }

        if (zindex != undefined && zindex < zspace.length) {

            z = zspace[zindex];
            console.log('zindex = ' + zindex);

            if (zindex == 0) {
                var sliceFunction0 = sliceFunctions[zindex];
                sliceFunction0.func = function(x) {
                    return Polynomial(x,z);
                };
                sliceFunction0.compute();
                global_matrix = sliceFunction0.transformation_matrix;
            }

            var sliceFunction = sliceFunctions[zindex];
            sliceFunction.func = function(x) {
                return Polynomial(x,z);
            };
            sliceFunction.compute();
            sliceFunction.adjust(coeffs);

            zindex++;

        }

        if (zindex == zspace.length) {
            zindex = undefined;
        }



    }

}
