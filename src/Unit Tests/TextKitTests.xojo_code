#tag Class
Protected Class TextKitTests
Inherits TestGroup
	#tag Event
		Function UnhandledException(err As RuntimeException, methodName As Text) As Boolean
		  #pragma unused err
		  
		  Const kMethodName As Text = "UnhandledException"
		  
		  If methodName.Length >= kMethodName.Length And methodName.Left(kMethodName.Length) = kMethodName Then
		    Assert.Pass("Exception was handled")
		    Return True
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub GetUnicodeCategoryTest()
		  // Passing more than one character should be the special "None" category.
		  Assert.IsTrue(TextKit.GetUnicodeCategory("ab") = _
		  TextKit.UnicodeCategories.None)
		  
		  // Close punctuation.
		  Assert.IsTrue(TextKit.GetUnicodeCategory("}") = _
		  TextKit.UnicodeCategories.ClosePunctuation)
		  Assert.IsFalse(TextKit.GetUnicodeCategory("{") = _
		  TextKit.UnicodeCategories.ClosePunctuation)
		  
		  // Connector punctuation.
		  Assert.IsTrue(TextKit.GetUnicodeCategory("︳") = _
		  TextKit.UnicodeCategories.ConnectorPunctuation)
		  Assert.IsFalse(TextKit.GetUnicodeCategory(".") = _
		  TextKit.UnicodeCategories.ConnectorPunctuation)
		  
		  // Control characters.
		  Assert.IsTrue(TextKit.GetUnicodeCategory(&u0008) = _
		  TextKit.UnicodeCategories.Control) // Backspace.
		  Assert.IsFalse(TextKit.GetUnicodeCategory("a") = _
		  TextKit.UnicodeCategories.Control)
		  
		  // Currency.
		  Assert.IsTrue(TextKit.GetUnicodeCategory("$") = _
		  TextKit.UnicodeCategories.CurrencySymbol)
		  Assert.IsTrue(TextKit.GetUnicodeCategory("£") = _
		  TextKit.UnicodeCategories.CurrencySymbol)
		  Assert.IsFalse(TextKit.GetUnicodeCategory("a") = _
		  TextKit.UnicodeCategories.CurrencySymbol)
		  
		  // Dash punctuation.
		  Assert.IsTrue(TextKit.GetUnicodeCategory("-") = _
		  TextKit.UnicodeCategories.DashPunctuation)
		  Assert.IsFalse(TextKit.GetUnicodeCategory("a") = _
		  TextKit.UnicodeCategories.DashPunctuation)
		  
		  // Decimal digits.
		  Assert.IsTrue(TextKit.GetUnicodeCategory("0") = _
		  TextKit.UnicodeCategories.DecimalDigitNumber)
		  Assert.IsTrue(TextKit.GetUnicodeCategory("1") = _
		  TextKit.UnicodeCategories.DecimalDigitNumber)
		  Assert.IsTrue(TextKit.GetUnicodeCategory("5") = _
		  TextKit.UnicodeCategories.DecimalDigitNumber)
		  Assert.IsTrue(TextKit.GetUnicodeCategory("9") = _
		  TextKit.UnicodeCategories.DecimalDigitNumber)
		  Assert.IsFalse(TextKit.GetUnicodeCategory("1.2") = _
		  TextKit.UnicodeCategories.DecimalDigitNumber)
		  Assert.IsFalse(TextKit.GetUnicodeCategory("a") = _
		  TextKit.UnicodeCategories.DecimalDigitNumber)
		  
		  #Pragma Warning "TODO: Finish"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsChopTest()
		  Var t As Text
		  
		  t = "Hello"
		  Assert.Istrue(t.Chop(3) = "He")
		  
		  t = "Test"
		  Assert.Istrue(t.Chop(0) = "")
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsDigitTest()
		  Var t As Text
		  
		  t = "1"
		  Assert.IsTrue(t.IsDigit, t)
		  
		  t = "5"
		  Assert.IsTrue(t.IsDigit, t)
		  
		  t = "20"
		  Assert.IsFalse(t.IsDigit, t)
		  
		  t = "2.5"
		  Assert.IsFalse(t.IsDigit, t)
		  
		  t = "4e-2"
		  Assert.IsFalse(t.IsDigit, t)
		  
		  t = "a"
		  Assert.IsFalse(t.IsDigit, t)
		  
		  t = "😀"
		  Assert.IsFalse(t.IsDigit, t)
		  
		  t = "hello"
		  Assert.IsFalse(t.IsDigit, t)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsLetterOrDigitTest()
		  Var t As Text
		  
		  t = "a"
		  Assert.IsTrue(t.IsLetterOrDigit, t)
		  
		  t = "é"
		  Assert.IsTrue(t.IsLetterOrDigit, t)
		  
		  t = "1"
		  Assert.IsTrue(t.IsLetterOrDigit, t)
		  
		  t = "😀"
		  Assert.IsFalse(t.IsLetterOrDigit, t)
		  
		  t = "☺️"
		  Assert.IsFalse(t.IsLetterOrDigit, t)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsLetterTest()
		  Var t As Text
		  
		  t = "a"
		  Assert.IsTrue(t.IsLetter, t)
		  
		  t = "😀"
		  Assert.IsFalse(t.IsLetter, t)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsLowercaseTest()
		  Var t1 As Text = "abc"
		  Var t2 As Text = "ABC"
		  Var t3 As Text = "axGwejH"
		  Var t4 As Text = "Very Cool"
		  
		  Assert.IsTrue(t1.IsLowercase)
		  Assert.IsFalse(t2.IsLowercase)
		  Assert.IsFalse(t3.IsLowercase)
		  Assert.IsFalse(t4.IsLowercase)
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotImplementedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StopTestOnFail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
