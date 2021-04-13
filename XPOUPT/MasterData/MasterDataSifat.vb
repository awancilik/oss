Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class MasterDataSifat
		Inherits XPLiteObject
		Dim fMasterDataSifatID As Guid
		<Key(true)> _
		Public Property MasterDataSifatID() As Guid
			Get
				Return fMasterDataSifatID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("MasterDataSifatID", fMasterDataSifatID, value)
			End Set
		End Property
		Dim fMasterDataSifatNama As String
		<Size(50)> _
		Public Property MasterDataSifatNama() As String
			Get
				Return fMasterDataSifatNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("MasterDataSifatNama", fMasterDataSifatNama, value)
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
