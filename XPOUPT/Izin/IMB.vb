Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IMB
		Inherits XPLiteObject
		Dim fIMBID As Guid
		<Key(true)> _
		Public Property IMBID() As Guid
			Get
				Return fIMBID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IMBID", fIMBID, value)
			End Set
		End Property
		Dim fPemohonID As Guid
		Public Property PemohonID() As Guid
			Get
				Return fPemohonID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PemohonID", fPemohonID, value)
			End Set
		End Property
		Dim fPermohonanID As Guid
		Public Property PermohonanID() As Guid
			Get
				Return fPermohonanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PermohonanID", fPermohonanID, value)
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
