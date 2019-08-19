# A html to text script in psotgresql with PL/Python

In postgres database, if you have some html data and you have to convert it to normal text, regulation expression (re) is a common solution. You always found that there are some mistake when you parse html with re, if you have installed the python extension (PL/Python), fortunately, we colud use the build-in module `html` to slove the problem.

- Why not beautiful soup?

Beautiful-soup is a user-friendly python module to parser html or xml data, but we must install it before we use it. In some special cases, installing is denied, so we give up.

### Useage

run pyhtml2text.sql or copy the content of this sql file and run in sql console.

### test

run the following statement in sql console

```sql
select pyhtml2text('<div><p>aa bb<span>c&nbspdd</sapn></p><br><p>fffff</p></div>');
```

the expected result is:

```
 pyhtml2text 
-------------
 aa bbc dd  +
            +
 fffff
(1 row)
```
