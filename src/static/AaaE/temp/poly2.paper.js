
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

// var seed =
// {
//     //"Math.pow(y, 1)":{"type":"number","value":1,"varname":"y"},
//     //"Math.pow(y, 2)":{"type":"number","value":2,"varname":"y2"},
//     "Math.pow(x, 3) * Math.pow(y, 5)":{"type":"number","value":2,"varname":"x3y"},
//     "Math.pow(x, 3) * Math.pow(y, 2)":{"type":"number","value":3,"varname":"x3y2"},
//     "Math.pow(x, 4)":{"type":"number","value":1,"varname":"x4"},
//     "Math.pow(x, 4) * Math.pow(y, 1)":{"type":"number","value":-13,"varname":"x4y"},
//     "Math.pow(x, 5) * Math.pow(y, 1)":{"type":"number","value":3,"varname":"x4y"},
//     "Math.pow(x, 6)":{"type":"number","value":1,"varname":"x5"},
//     "Math.pow(x, 3) * Math.pow(y, 1)":{"type":"number","value":1,"varname":"x3y"},
//     "Math.pow(x, 3) * Math.pow(y, 2)":{"type":"number","value":1,"varname":"x3y2"},
// }

// var seed =
// {
//     "Math.pow(x, 4) * Math.pow(y, 1)":{"type":"number","value":-2,"varname":"x4y"},
//     "Math.pow(x, 5)":{"type":"number","value":3,"varname":"x5"}
// }

var horizontalExpansionCoeff = 1.2;
var primes = [2,3,5,7,11,13,17,19,23,29,31];

var regex1 = /([a-z])\^([0-9])/;
var regex2 = /(Math\.pow\([^\)]+\))(Math\.pow\([^\)]+\))/;

var coeffs = _.map(_.pairs(seed), function(pair) {
    //return pair[1].value;
    return (Math.random()*10)-5;
});
var original_coeffs = coeffs;

var coeffObj = _.mapObject(seed, function(value, key) {
    return value.value;
})

console.log(coeffObj);

function getPolynomialFunction(coeffs) {
    return _.reduce(_.mapObject(coeffObj, function(value, key) {
        return value.toString() + '*' + key.toString()
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
        this.path.removeSegments();
        //console.log('path1', this.path);
        this.matrix_premult = matrix_premult;
        this.map3d = map3d;
        this.tmatrix = tmatrix;

        // if (map3d) {
        //     this.points = this.points3d;
        // } else {
        //     this.points = this.getPoints();
        // }

        // if (matrix_premult) {
        //     this.points = _.map(this.points, function(p) {
        //         return numeric.dot(matrix_premult, p);
        //     })
        // }

        this.points.push(new Point(this.domain.max*1.2, Math.abs(this.codomain.min)*-1.3
            + Math.abs(this.codomain.max)*-1.3));
        this.points.push(new Point(this.domain.min*1.2, Math.abs(this.codomain.min)*-1.3
            + Math.abs(this.codomain.max)*-1.3));

        var self = this;
        _.each(this.points, function(p) { self.path.add(new Point(p)); });

        this.path.closed = true;
        //this.path.selected = true;

        if (tmatrix) {
            this.path.transform(tmatrix);
        } else {
            this.path.transform(this.transformation_matrix);
        }



        //console.log('path2', this.path);
        //this.project();
        path.smooth();
    },


}

function projectPath(path, z) {
    path.scale(1-(z/50), 1-(z/50), view.center)
    path.translate(new Point(-10*z, 30*z))
}

console.log(getPolynomialFunction(coeffs));

var Polynomial = function(cfs, x,y) {
    var fn = getPolynomialFunction(cfs);
    eval("var r = " + fn + ";");
    return r;
}



xrange = [-5, 5];
zrange = [0,-4];
zspace = numeric.linspace(zrange[0], zrange[1], 20);


F0 = function(x) { return Polynomial(coeffs, x,0); }
slice0 = new MFunction(F0, [xrange[0],xrange[1]]);
slice0.compute();
console.log(slice0.codomain.min, slice0.codomain.max);
global_matrix = slice0.transformation_matrix;
console.log(global_matrix);

GraphLayer = new Layer({
    //blendMode: 'multiply'
});

var zindex = undefined;
var drawing = true;
var animating = false;
zindex = 0;

var slices = [];
var sliceFunctions = [];

var animationCycle = undefined;

view.onFrame = function(event) {
    if (drawing && zindex != undefined && zindex < zspace.length) {
        //console.log('drawing');
        z = zspace[zindex];

        F = function(x) { return Polynomial(coeffs, x,z); }
        var slice = new MFunction(F, [xrange[0],xrange[1]]);

        points3d = slice.getPoints();
        _.each(_.range(points3d.length), function(i) {
            points3d[i].push(z);
        });
        slice.points3d = points3d;

        var indexCoeff = 1-((zindex/zspace.length)*0.8);

        var path1 = new Path({
            strokeColor: new Color(0.3, 0.3, 0.3, 0.6*indexCoeff),
            strokeWidth: 1,
            //closed: true,
            fillColor: new Color(Math.random(),1,Math.random(),0.4*indexCoeff),
        });

        slice.draw(path1, null, true, global_matrix);
        slices.push(path1);
        sliceFunctions.push(slice);
        projectPath(path1, z);

        obj = project.activeLayer.insertChild(0,path1);

        zindex++;

    } else {
	 	if (zindex && drawing) {
		  	drawing = false;
            animating = true;
            animationStart = event.count;
            zindex = undefined;
            animationCycle = undefined;
		}
	}

    if (animating) {

        if (animationCycle === undefined) {
            //animationStart = event.count;
            //animationCount = event.count - animationStart;
            zindex = undefined;
            animationCycle = -1;

            originalValues = _.mapObject(coeffObj, function(value, key) {
                return value;
            })

        }



        //zindex = zindex % slices.length

        if (zindex === undefined) {

            animationCycle++;

            console.log('animation cycle @ ' + animationCycle);

            // if this is 1st time through current cycle
            // change coefficients
            coeffs = _.map(_.range(0,original_coeffs.length), function(i) {
                return original_coeffs[i] * (slice0.codomain.max) * Math.cos(  animationCycle/100  )
                //return (Math.random()*10)-5;
                //return coeffs[i] + ((Math.random()*109)-50);
            });

            coeffObj = _.mapObject(coeffObj, function(value, key) {
                return originalValues[key] * Math.cos(  animationCycle/10  )
            })

            //console.log('coeffs changed', coeffs);

            // reset zindex
            zindex = 0;
        }

        if (animationCycle > 1000) animating = false;

        if (zindex != undefined && zindex < zspace.length) {

            z = zspace[zindex];
            //console.log('zindex = ' + zindex);

            G = function(x) { return Polynomial(coeffs, x,z); }
            var sliceFunction = new MFunction(G, [xrange[0],xrange[1]]);

            var slice = slices[zindex];
            //var indexCoeff = 1-((zindex/zspace.length)*0.8);

            // var path1 = new Path({
            //     strokeColor: new Color(0.3, 0.3, 0.3, 0.6*indexCoeff),
            //     strokeWidth: 1,
            //     //closed: true,
            //     fillColor: new Color(Math.random(),1,Math.random(),0.4*indexCoeff),
            // });

            //slice.removeSegments();

            sliceFunction.compute();
            sliceFunction.getPoints();

            if (z == 0) {
                //global_matrix = sliceFunction.transformation_matrix;
                //console.log('global_matrix', global_matrix);
            }

            sliceFunction.draw(slice, null, true, global_matrix)

            // _.each(_.range(sliceFunction.points.length), function(i) {
            //     //console.log(slice.segments[i].point);
            //     //console.log((new Point(sliceFunction.points[i])).transform(global_matrix));
            //     slice.segments[i].point = (new Point(sliceFunction.points[i])).transform(global_matrix);
            // })

            projectPath(slice, z);

            zindex++;

        }

        if (zindex == zspace.length) {
            zindex = undefined;
        }



    }

}
