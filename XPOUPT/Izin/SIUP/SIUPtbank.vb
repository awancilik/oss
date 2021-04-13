Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SIUPtBank
		Inherits XPLiteObject
		Dim fBankID As Integer
		<Key()> _
		Public Property BankID() As Integer
			Get
				Return fBankID
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("BankID", fBankID, value)
			End Set
		End Property
		Dim fBank As String
		<Size(30)> _
		Public Property Bank() As String
			Get
				Return fBank
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Bank", fBank, value)
			End Set
		End Property
		Public Sub New(ByVal session As Session)
			MyBase.New(session)
		End Sub
		Public Sub New()
			MyBase.New(Session.DefaultSession)
		End Sub
		Public Overrides Sub AfterConstruction()
			MyBase.AfterConstruction()
		End Sub
	End Class

End Namespace
