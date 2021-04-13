Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class MasterDataSyarat
		Inherits XPLiteObject
		Dim fMasterDataSyaratID As Guid
		<Key(true)> _
		Public Property MasterDataSyaratID() As Guid
			Get
				Return fMasterDataSyaratID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("MasterDataSyaratID", fMasterDataSyaratID, value)
			End Set
		End Property
		Dim fMasterDataSyaratNama As String
		Public Property MasterDataSyaratNama() As String
			Get
				Return fMasterDataSyaratNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("MasterDataSyaratNama", fMasterDataSyaratNama, value)
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
