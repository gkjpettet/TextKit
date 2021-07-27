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
		  Assert.IsTrue(TextKit.Chop("Hello", 3) = "He")
		  Assert.IsTrue(TextKit.Chop("Test", 0) = "")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsDigitTest()
		  Assert.IsTrue(TextKit.IsDigit("1"), "1")
		  Assert.IsTrue(TextKit.IsDigit("5"), "5")
		  Assert.IsFalse(TextKit.IsDigit("20"), "20")
		  Assert.IsFalse(TextKit.IsDigit("2.5"), "2.5")
		  Assert.IsFalse(TextKit.IsDigit("4e-2"), "4e-2")
		  Assert.IsFalse(TextKit.IsDigit("a"), "a")
		  Assert.IsFalse(TextKit.IsDigit("😀"), "😀")
		  Assert.IsFalse(TextKit.IsDigit("hello"), "hello")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsLetterOrDigitTest()
		  Assert.IsTrue(TextKit.IsLetterOrDigit("a"), "a")
		  Assert.IsTrue(TextKit.IsLetterOrDigit("é"), "é")
		  Assert.IsTrue(TextKit.IsLetterOrDigit("1"), "1")
		  Assert.IsFalse(TextKit.IsLetterOrDigit("😀"), "😀")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsLetterTest()
		  Assert.IsTrue(TextKit.IsLetter("a"), "a")
		  Assert.IsFalse(TextKit.IsLetter("😀"), "😀")
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
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
