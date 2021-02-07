// based on https://viewsourcecode.org/why/hackety.org/2008/01/10/lazyBricksLazyMortar.html
Builder := Object clone

Builder forward := method(tag(call message name, call message argAt(0)))

Builder tag := method(name, nodes,
  inner := ""
  while(nodes,
    if(nodes name != ";",
      inner = inner .. if(nodes argCount > 0,
        tag(nodes name, nodes argAt(0)),
        doMessage(nodes))
    )
    nodes = nodes next
  )
  "<#{name}>#{inner}</#{name}>\n" interpolate
)
