Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class sertifikat
		Inherits XPLiteObject
        Dim fSertifikatID As Guid
        <Key(True)> _
        Public Property SertifikatID() As Guid
            Get
                Return fSertifikatID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("SertifikatID", fSertifikatID, value)
            End Set
        End Property
		Dim fNoIjin As String
		<Size(45)> _
		Public Property NoIjin() As String
			Get
				Return fNoIjin
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NoIjin", fNoIjin, value)
			End Set
		End Property
		Dim fNoSertifikat As String
		<Size(30)> _
		Public Property NoSertifikat() As String
			Get
				Return fNoSertifikat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NoSertifikat", fNoSertifikat, value)
			End Set
		End Property
		Dim fPemilikSerifikat As String
		<Size(30)> _
		Public Property PemilikSerifikat() As String
			Get
				Return fPemilikSerifikat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemilikSerifikat", fPemilikSerifikat, value)
			End Set
		End Property
		Dim fStatusTanah As String
		<Size(30)> _
		Public Property StatusTanah() As String
			Get
				Return fStatusTanah
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("StatusTanah", fStatusTanah, value)
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
