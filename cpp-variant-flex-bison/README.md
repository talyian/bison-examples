# Cpp Variant Parser

Instead of the union-based parser, bison supports `%define api.value.type variant`, which changes the declaration in the grammar to real types instead of union cases.

This involved a few more convolutions to get the declarations correct, including `#including` the generated parser header from within the .yy file (which I'm pretty sure smells like a Bad Idea).