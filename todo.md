

- main page design
  - simplify -- show bg-app more prominently
  - list top n apps, with more... list by name, show category only on lower level
  - sequences of thumbnail images, improve directive to always load integral multiple of #-per-row

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

- lazy loading

completeness: 0/5

---------------------


- main instance page
  - [x] mobile -> seed editor as popup only
  - work in reactive sizing into userapps themselves?



- [x] category only if enabled
- [x] popularity indeces
- [x] ordering
- [x] popularity

======================


- instance.js -- upon delete instance, not removing from DOM?
- play-through
