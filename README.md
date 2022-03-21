# Oyster Tank Simulation Model

> Model for simulation of an oyster depuration system (OpenFOAM-v2012)

## Generate mesh

- Install gmsh http://gmsh.info
- run command \
`gmsh -0 -3 -f msh2 -o oysterTank.msh oysterTank.geo`

## Convert gmsh to foam mesh
- run command \
`gmshToFoam oysterTank.msh > log.gmshToFoam 2>&1 &`

## Edit file constant/polyMesh/boundary and set patch type to wall for bottom/top/left/right/front/back

## Check mesh
- run command \
`checkMesh > log.checkMesh 2>&1 &`

## Create inlet/outlet cell sets and porosity zone
- run command \
`topoSet > log.topoSet 2>&1 &`

# Create inlet/outlet patches
- run command \
`createPatch log.createPatch 2>&1 &`

# For serial run
- run commands \
`source $WM_PROJECT_DIR/bin/tools/RunFunctions` \
`restore0Dir` \
`runApplication $(getApplication)` 

# For parallel run
- Edit file system/decomposeParDict accordingly
- run commands \
`source $WM_PROJECT_DIR/bin/tools/RunFunctions` \
`restore0Dir` \
`runApplication decomposePar` \
`runParallel renumberMesh -overwrite` \
`runParallel $(getApplication)` 

