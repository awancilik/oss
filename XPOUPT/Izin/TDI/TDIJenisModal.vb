Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TDIJenisModal
		Inherits XPLiteObject
		Dim fJenisModalID As Guid
		<Key(true)> _
		Public Property JenisModalID() As Guid
			Get
				Return fJenisModalID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("JenisModalID", fJenisModalID, value)
			End Set
		End Property
		Dim fJenisModal As String
		<Size(20)> _
		Public Property JenisModal() As String
			Get
				Return fJenisModal
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisModal", fJenisModal, value)
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
