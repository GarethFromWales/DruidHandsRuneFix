# DruidHandsRuneFix
A lightweight addon that fixes feral druid hand rune ability usage in macros.

```/cast Sunfire(Bear)```

will automatically be updated to

```/cat Mangle(Bear)```

when you change to the Mangle rune.

Similary:

```/cast Mangle(Bear)```

will automatically be updated to

```/cat Sunfire(Bear)```

when you change to the Sunfire rune.

This works for complex macros too like:

```
#showtooltip
/cast [noform] Wrath
/cast [form:1] Sunfire(Bear)
/cast [form:1] Maul
/cast [nomod,form:3,stealth] Ravage
/cast [nomod,form:3] Sunfire(Cat)
/cast [mod,form:3] Rake
/startattack
```

will auto update to:

#showtooltip
/cast [noform] Wrath
/cast [form:1] Mangle(Bear)
/cast [form:1] Maul
/cast [nomod,form:3,stealth] Ravage
/cast [nomod,form:3] Mangle(Cat)
/cast [mod,form:3] Rake
/startattack

when you switch to the Mangle rune  (or equip equipment with the Mangle rune).

I didn't bother adding support for Skull Bash and Wild Growth as supporting them is a lot more complex and I don't need that myself. If there is enough interest maybe I'll create something more complex so SOD macros can support the [known] modifier, will see...
