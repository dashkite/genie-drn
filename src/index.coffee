import * as Fn from "@dashkite/joy/function"
import { replace } from "@dashkite/drn"
import { load } from "@dashkite/drn-loader"
import * as H from "@dashkite/masonry-hooks"
import Glob from "micromatch"
import YAML from "js-yaml"
import Zephyr from "@dashkite/zephyr"

defaults =
  glob: "./**/*.{yaml,json}"

match = ( path, glob ) ->
  Glob.isMatch path, glob

export default ( Genie ) ->

  # load DRN resolvers
  await do load

  # save the original configuration
  configuration = structuredClone do Genie.read

  options = { defaults..., ( Genie.get "drn" )... }
  
  # register read handler to perform replacement
  H.register "read", ( context ) ->
    if match context.source.path, options.glob
      context.input = await do ->
        switch context.source.extension
          when ".json"
            do Fn.flow [
              Fn.pipe [
                Fn.wrap context.input
                JSON.parse
              ]
              replace
              JSON.stringify
            ]
          when ".yaml"
            do Fn.flow [
              Fn.pipe [
                Fn.wrap context.input
                YAML.load
              ]
              replace
              YAML.dump
            ]

  Genie.define "drn:replace", ->
    Zephyr.clear()
    Genie.write await replace configuration

  Genie.before "build", "drn:replace"
  Genie.before "publish", "drn:replace"



    