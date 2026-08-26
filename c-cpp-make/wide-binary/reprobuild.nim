## A DELIBERATELY WIDE C executable: 65 independent translation units.
##
## Same convention as ``../binary`` -- no ``build:`` block, the M17
## C/C++-make convention recognises the layout and emits one ``cc -c``
## action per source plus one link action. The only thing that differs
## is the WIDTH: ``../binary`` has a single source and therefore two
## actions, which is enough to demonstrate the convention and not nearly
## enough to put a scheduler under contention.
##
## This example exists because RunQuota's M1 milestone
## (``reprobuild-specs/RunQuota-Observation-Store.milestones.org``) asks
## for admission and completion-reporting cost measured against "a real
## wide build", and a two-action build cannot answer that: with fewer
## ready actions than parallel slots, nothing ever queues and admission
## is never contended. 65 units against a typical 8-16 way scheduler
## keeps the ready set saturated for the whole build.
##
## The sources are generated -- see ``generate-sources.py`` for the unit
## count, the per-unit cost, and why both are what they are.

import repro_project_dsl

package c_cpp_make_wide_binary_example:
  uses:
    "gcc >=11"
    "make >=4"

  executable widecalc:
    discard
