operations := list("1 + 1", "1 + \"1\"", "1 + \"one\"")
operations foreach(i, v,
    write(v, "\t\t")
    e := try(doString(v); "OK" println)
    e catch(Exception, writeln("Exception: '", e error, "'"))
)
"Io is strongly typed! The string is not cast implicitly to a number." println

list(0, "", nil) foreach(i, v, writeln(v, " is ", if(v, true, false)))