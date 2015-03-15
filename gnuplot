set terminal qt font "Droid Sans, 12" enhanced
set encoding iso_8859_15
set style data lines

## line styles
set style line 1  linecolor rgb "blue" pointsize 1 pointtype 7
set style line 2  linecolor rgb "red" pointsize 1 pointtype 9
set style line 3  linecolor rgb "dark-green" pointsize 1 pointtype 5
set style line 4  linecolor rgb "dark-violet" pointsize 1
set style line 5  linecolor rgb "dark-orange" pointsize 1
set style line 6  linecolor rgb "brown" pointsize 1
set style line 7  linecolor rgb "dark-pink" pointsize 1
set style line 8  linecolor rgb "gold" pointsize 1
set style line 9  linecolor rgb "dark-cyan" pointsize 1
set style line 10 linecolor rgb "spring-green" pointsize 1

set style line 20 linecolor rgb "#cccccc"
set grid ls 20

set key top right width 1 height 1 box

set macros
MATLAB = "defined (0  0.0 0.0 0.5, \
                   1  0.0 0.0 1.0, \
                   2  0.0 0.5 1.0, \
                   3  0.0 1.0 1.0, \
                   4  0.5 1.0 0.5, \
                   5  1.0 1.0 0.0, \
                   6  1.0 0.5 0.0, \
                   7  1.0 0.0 0.0, \
                   8  0.5 0.0 0.0 )"
