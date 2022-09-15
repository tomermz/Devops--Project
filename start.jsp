<html>

<body>

<form method=POST action=guess.jsp>

<h1>
Welcome to the guessing game.
</h1>

<p>
Please think of a number between<br>
<input type=text align=right value=1 name=lower>
 (lower bound) and<br>
<input type=text align=right value=1000 name=upper>
 (upper bound)
</p>

<p>
<input type=submit value="Click to proceed.">
</p>

<input type=hidden name=questionsSoFar value=0>

</form>

</body>

</html>