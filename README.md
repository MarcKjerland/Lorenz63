# Lorenz63
Some methods for the Lorenz 63 system in Octave/Matlab

lorenz63ensemble-movie.m - Generates sequence of frames of an ensemble of points in 3-space evolving under the dynamics of the Lorenz 63 system. After the script is run, the images can be converted to a movie using, for example, ffmpeg: `ffmpeg -r 20 -i pix/lorenz%04d.png -vcodec ffv1 -sameq pix/lorenz_ensemble.avi`

The above script was used to generate this [Youtube video](https://www.youtube.com/watch?v=5mI8dxs6-BY).

spaghetti-plot.m - Generates a [spaghetti plot](https://en.wikipedia.org/wiki/Spaghetti_plot) showcasing the chaotic nature of the Lorenz 63 system. Several solutions are plotted in time starting from nearly identical initial conditions; the trajectories slowly diverge and eventually hit a sudden rapid divergence.
