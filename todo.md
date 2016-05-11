## remaining after 5-10-16 ##

- add fork-app feature
  - track parent-app hierarchy
- add hook for music viz through user-app editor

## 5-10-16 ##

- create vectors-path (a given consecutive instance-set of vectors from one space)
  - use vector-paths as option for main page display
  - implement on polynomial landscape
- fork and tidy existing apps
  - poly landscape, subgroups
- copy: rename objects (adhere to 'vector' and 'space')
- lazy loading


# Early May 2016 #

- user: add select specific snapshots to display in collections

--------------------

- main page design
  - [x] simplify -- show bg-app more prominently
  - [x] app listing
  - [x] list top n apps, with more... list by name, show category only on lower level
    - [x] sequences of thumbnail images, improve directive to always load integral multiple of #-per-row
  - homogenize imagesets, add 1 largest per app

completeness: 4/5

-------------------

- [x] verify vectorparams working on update and save
  - [x] color to number
  - [x] compare to older

- if no seed, request to app-ordered fails (3D maze)

completeness: 9/10

--------------------

- [x] seedify bg-app
  - [x] keep b&w
  - [x] operator overloading
    - solution 1: compile at runtime
    - [x not good] solution 2 (better for now?): convert all vec operations to sylvester
    - solution 3: easiest: django templates with real javascript instead of eval()
    - [x] solution 4 [CHOSEN]: use directive for all canvases!

completeness: 5/5

----------------------


- main instance page
  - [x] mobile -> seed editor as popup only
  - work in reactive sizing into userapps themselves?



- [x] category only if enabled
- [x] popularity indeces
- [x] ordering
- [x] popularity


# Late April 2016 #

- [x] verify vectorparams working on update and save
- [x] rethink (simplify) layout of front page to show bg-app more
- [x] sequences of thumbnail images, improve directive to always load integral multiple of #-per-row

# Early April 2016 #

## !LSO ##

### remaining 4-13 ###
- [x] make login/signup template/navigation consistent
- [x] disable signup
- [x] change z-index of loader to make toolbar buttons clickable!
- [x] aws-serv:
  - [x] socketio bug
- [x] ensure seedvals always parsed and are consistent
- [x] seed-vector ordering
- [x] increment popularity upon view of `things`
- [x] iPhone vertical layout
- [x] create seed->psqlcol transform for indexing by seed-vector
- [x] order display of instances on app-detail page
- [x] enforce 1 unique instance per seed-vector



### remaining 4-08 ###
- [x] instance-sets (automatization of snapshots and instance creation by varying 1 seed param through set of values)
    - [x] user control
    - [x] function

### other ###
- [x] redesign main layout and flow (simplified)
  - [x] seed editor, bottombar bugs
  - [x] change seed editor into seeddisplay and mdDialog
- [x] multiple canvas / paper issue
  - [x] make one directive for both canvases (did iframe instead)
  - snapshots
- [x] rework instance creation
- [x] remove multi-user elements (equivalent to user-not-logged-in)
- check security in API
- [x] add extra panel for featured mathematical expression display
- [x] add algebraeic symmetry subgroups app
- [x] fractal trees, add color2 on last iteration for creation of flowers as well as trees

## other ##
- [x] enforce only one instance per seed vector
- [x] make seed editor movable / transparent / collapsable
  - [x] well, smaller anyway



# Late March 2016 #

# Front-end #

- [x] codemirror does not show text until clicked
- [x] in instance display: upon change seed values, does not clear canvas fully before redraw
  - 2-dim maze only?

# General #
- [x] mathjax not redrawing on some navigation

# Symbolic math #

- [x] "sin(x)cos(y)" without space does not parse
  - review sympy parser options

- [x] add handlers to ensure canvas clear upon instance destroy
- [x] make music stop upon app destroy

## mar 25 ##

- [x] integrate audio analysis, music viz capability
- [x] colorpicker input in seededitor
- [x] repair resaving and re-running of app, (after seed-struct refactoring)
- [x] finish implementing `start()` and `destroy()` interface for all apps
  - [x] remove event listeners
  - [x] delete vars?
  - [x] on Three.js, extra canvases must be removed
- [x] eval coffeescript
- [x] modularize functions in apps -- `CodeModule`
- modularize functions in apps -- `SavedFunction`
  - [x] make sure it works with paper (outside inclusion has shown to be problematic in past)
- [x] app-editor: on load larger source, need loading spinner on codemirror textareas

# Early March #

## front-end ##

- [x] re-integrate previous work linking sympy backend to parse (mathematical -> javascript -> latex) expressions
  - [x] slight reconfiguring of seedStructure specs, add "math" datatype

- [x] upon edit seedStructure, append default to existing instances' seeds
- [x] finish implementing "color" datatype in seed editor

## specific apps ##
### Maze-2d ###
- multiple solvers still showing when many different instances are viewed back-to-back

## style / templates ##
- login/account right-end topbar
- top bar
  - transparent/not-transparent anim
- bottom bar covering seed-editor codemirror window

- [x] delete instance
- [x] save-as-new-instance function
- [x] save-as-new-instance button should re-execute app IF seed changed
- [x] automatic screenshot each seed-change

- [x] fix paper.js new-seed redraw bug
- [x] add catch for syntax error in seed structure

- [x] add "loading" indicator on:
  - [x] load instance
- seed editor
  - [x] fix 2-way binding
    - _(fixed, but not as cleanly as I would have liked)_
      - _(should have used component/directive -- perhaps the problem is the fact that the scope for this is within a call to `eval()`)_


## instance display page ##
- on reload instance, canvas seems to be getting cleared, but variables from the `eval()`-ed scope need to be wiped.  (Why are elements of the previous instance rendering still showing) [easyfix: reload page -> :(]

- after take snapshot on load page, when navigate back -- bindings do not render in template!
  - this one seems to be a fluke that may have been fixed by correcting something in `instance.js` ?? [to re-investigate]

- [x] instantiate function

- add apps:
  - fractal trees
  - musicviz
    - assemble playlist



# Feb. 11, 2016 #
- design UI with angular-material, html-component first
- merge back existing angular app `plsysApp`


# Feb. 3, 2016 #

to research:
- CSRF tokens (or lack of them) in AJAX requests with rest_framework
  - snapshot feature has a successful ajax POST (but obvious security hole to fix later)
    - so why new `symbolic_math/latex` function returning 403?

to do:
- [x] layout of main apps page
- correct automatic symbol slicing error on symbolic_math latex function
- [x] add special handling for three.js scripts, different snapshot function for WebGL, etc.

# Feb. 2, 2016 #

## seed display / editor ##

seed display for polynomial landscape
- [x] incorporate latex (compile on server with sympy)
- 3 seeds:
  - display:
    - full function in latex/mathjax
    - projection matrix in latex/mathjax
    - target color (only splotch, no number)
    - (edit icon or cog beneath)
  - editor:
    - small modal window
    - 1 field for each coefficient (use sympy to compute the list of coeffecient combinations

_(seed editor edits the ACTUAL seeds from the JSON -- an app may choose to display something on the "fancy screen", meaning it is always present.  Everything else, accessible only by cog)_


------------

ordered tasks:
("before I can do __ , I need to do ___") ::repeat

- [x] investigate **sympy [chosen]** vs. sage for latex generation
- [x] add server-side hooks for math. processing (`symbolic_math` module)
- [x] map between js, sympy, and math. function syntax
- [x] latex/mathjax on screen

# Feb. 1, 2016 #
to learn:
- SASS or SCSS
  - [x] [LESS chosen and implemented]

to do on plerp tonight:
- function in 1 var, 1 param
  - [x] add string inputs to seed-editor
	(most of work tonight on seeds)
- modularize paperscript code-groups (cartesian plane setup, for example) into includable-by-user modules
