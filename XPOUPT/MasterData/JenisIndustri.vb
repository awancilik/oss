Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class JenisIndustri
		Inherits XPLiteObject
		Dim fJenisIndustriID As Guid
		<Key(true)> _
		Public Property JenisIndustriID() As Guid
			Get
				Return fJenisIndustriID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("JenisIndustriID", fJenisIndustriID, value)
			End Set
		End Property
        Dim fJenisIndustri As String
        <Size(50)> _
        <Persistent("JenisIndustri")> _
        Public Property JenisIndustri() As String
            Get
                Return fJenisIndustri
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisIndustri", fJenisIndustri, value)
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
