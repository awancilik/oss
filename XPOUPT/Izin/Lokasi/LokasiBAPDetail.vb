Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class LokasiBAPDetail
		Inherits XPLiteObject
		Dim fLokasiBAPSaranID As Guid
		<Key(true)> _
		Public Property LokasiBAPSaranID() As Guid
			Get
				Return fLokasiBAPSaranID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiBAPSaranID", fLokasiBAPSaranID, value)
			End Set
		End Property
        Dim fLokasiBAPID As LokasiBAP
        Public Property LokasiBAPID() As LokasiBAP
            Get
                Return fLokasiBAPID
            End Get
            Set(ByVal value As LokasiBAP)
                SetPropertyValue(Of LokasiBAP)("LokasiBAPID", fLokasiBAPID, value)
            End Set
        End Property
		Dim fTimTeknis As String
		<Size(50)> _
		Public Property TimTeknis() As String
			Get
				Return fTimTeknis
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TimTeknis", fTimTeknis, value)
			End Set
		End Property
		Dim fSaran As String
		<Size(255)> _
		Public Property Saran() As String
			Get
				Return fSaran
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Saran", fSaran, value)
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
