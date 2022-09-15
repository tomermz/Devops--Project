<%! 
    int numGuesses(int n) {
      double log2n = Math.log10(n) / Math.log10(2);
      double ceil = Math.ceil(log2n);
      return ((int)ceil);
    }
%>

<% 
   String answer = request.getParameter("answer");
   String lower = request.getParameter("lower");
   String upper = request.getParameter("upper");
   int iLower = 0;
   int iUpper = 0;
   try {
     iLower = Integer.parseInt(lower);
     iUpper = Integer.parseInt(upper);     
   } catch (NumberFormatException e) {
%> <jsp:forward page="start.jsp" /> <%
   } catch (Exception e) {
     throw e;
   }
   if (iUpper < iLower){
%> <jsp:forward page="start.jsp" /> <%
   }   

   int q = Integer.parseInt(request.getParameter("questionsSoFar"));

   String rg = request.getParameter("requiredGuesses");
   int requiredGuesses = 0;
   if (rg == null)
     requiredGuesses = numGuesses(iUpper - iLower + 1);
   else
     requiredGuesses = Integer.parseInt(rg);

   int pivot = (iUpper + iLower) / 2;

   if (answer != null) {
     if (answer.equals("yes"))
        iUpper = pivot;
     else
        iLower = pivot+1;
   }

   pivot = (iUpper + iLower) / 2;

   boolean doneGuessing = false;
   if (iLower == iUpper)
      doneGuessing = true;   
%>

<html>

<%
  if (doneGuessing) {
%>

<h1>
You are thinking of <%= iUpper %>!
</h1>

<h2>It required <%= q %> questions to guess that.</h2>

<h2>I predicted <%= requiredGuesses %> questions. So there.</h2>

<p>
<a href=start.jsp>Play again?</a>
</p>

<% } else { %>

<h1>
You are thinking of a number. <br>
It will take me <%= requiredGuesses %> guesses to guess it!
</h1>

<h2>The computer has asked <%= q+1 %> questions so far.</h2>

<p>
Is your number less than or equal to <%= pivot %>?
<form method=POST action=guess.jsp>
<input type=submit name=answer value="yes">
<input type=submit name=answer value="no">
</p>

<input type=hidden name="lower" value=<%= iLower %>>
<input type=hidden name="upper" value=<%= iUpper %>>
<input type=hidden name="questionsSoFar" value=<%= q+1 %>>
<input type=hidden name="requiredGuesses" value=<%= requiredGuesses %>>

</form>

<% } %>

</html>