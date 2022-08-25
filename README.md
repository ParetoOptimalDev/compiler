# Building for multiple platforms status


##### using musl 64

```shell
$ nix build
error: builder for '/nix/store/s7fzmnaswifs287kq8axmvbkzma0n6v5-elm-exe-elm-0.19.1.drv' failed with exit code 1;
       last 10 log lines:
       > terminal/src/Develop/StaticFiles.hs:91:3: error:
       >     • Exception when trying to run compile-time code:
       >         reactor: changeWorkingDirectory: does not exist (No such file or directory)
       >       Code: (bsToExp =<< runIO Build.buildReactorFrontEnd)
       >     • In the untyped splice:
       >         $(bsToExp =<< runIO Build.buildReactorFrontEnd)
       >    |
       > 91 |   $(bsToExp =<< runIO Build.buildReactorFrontEnd)
       >    |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
       > [131 of 132] Compiling Bump             ( terminal/src/Bump.hs, dist/build/elm/elm-tmp/Bump.o, dist/build/elm/elm-tmp/Bump.dyn_o )
       For full logs, run 'nix log /nix/store/s7fzmnaswifs287kq8axmvbkzma0n6v5-elm-exe-elm-0.19.1.drv'.
 ```




# Elm

A delightful language for reliable webapps.

Check out the [Home Page](http://elm-lang.org/), [Try Online](http://elm-lang.org/try), or [The Official Guide](http://guide.elm-lang.org/)


<br>

## Install

✨ [Install](https://guide.elm-lang.org/install/elm.html) ✨

For multiple versions, previous versions, and uninstallation, see the instructions [here](https://github.com/elm/compiler/blob/master/installers/README.md).

<br>

## Help

If you are stuck, ask around on [the Elm slack channel][slack]. Folks are friendly and happy to help with questions!

[slack]: http://elmlang.herokuapp.com/
