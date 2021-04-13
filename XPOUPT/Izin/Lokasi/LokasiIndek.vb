Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class LokasiIU
		Inherits XPLiteObject
		Dim fLokasiIU_ As Guid
		<Key(true)> _
		<Persistent("LokasiIU")> _
		Public Property LokasiIU_() As Guid
			Get
				Return fLokasiIU_
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiIU_", fLokasiIU_, value)
			End Set
		End Property
		Dim fJenis As String
		<Size(10)> _
		Public Property Jenis() As String
			Get
				Return fJenis
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Jenis", fJenis, value)
			End Set
		End Property
		Dim fIndek As Double
		Public Property Indek() As Double
			Get
				Return fIndek
			End Get
			Set(ByVal value As Double)
				SetPropertyValue(Of Double)("Indek", fIndek, value)
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

	Public Class LokasiIP
		Inherits XPLiteObject
		Dim fLokasiIP_ As Guid
		<Key(true)> _
		<Persistent("LokasiIP")> _
		Public Property LokasiIP_() As Guid
			Get
				Return fLokasiIP_
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiIP_", fLokasiIP_, value)
			End Set
		End Property
		Dim fIPTanah As String
		<Size(50)> _
		Public Property IPTanah() As String
			Get
				Return fIPTanah
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IPTanah", fIPTanah, value)
			End Set
		End Property
		Dim fIndeks As Double
		Public Property Indeks() As Double
			Get
				Return fIndeks
			End Get
			Set(ByVal value As Double)
				SetPropertyValue(Of Double)("Indeks", fIndeks, value)
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
