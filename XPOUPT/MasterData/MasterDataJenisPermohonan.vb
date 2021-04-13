Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class MasterDataJenisPermohonan
		Inherits XPLiteObject
		Dim fMasterDataJenisPermohonanID As Guid
		<Key(true)> _
		Public Property MasterDataJenisPermohonanID() As Guid
			Get
				Return fMasterDataJenisPermohonanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("MasterDataJenisPermohonanID", fMasterDataJenisPermohonanID, value)
			End Set
		End Property
        Dim fMasterDataJenisPermohonanNama As String
        <Size(50)> _
        Public Property MasterDataJenisPermohonanNama() As String
            Get
                Return fMasterDataJenisPermohonanNama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("MasterDataJenisPermohonanNama", fMasterDataJenisPermohonanNama, value)
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
