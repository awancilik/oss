Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class JenisPermohonanIzin
		Inherits XPLiteObject
		Dim fJenisPermohonanIzinID As Guid
		<Key(true)> _
		Public Property JenisPermohonanIzinID() As Guid
			Get
				Return fJenisPermohonanIzinID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("JenisPermohonanIzinID", fJenisPermohonanIzinID, value)
			End Set
		End Property
        Dim fJenisIzinID As JenisIzin
        Public Property JenisIzinID() As JenisIzin
            Get
                Return fJenisIzinID
            End Get
            Set(ByVal value As JenisIzin)
                SetPropertyValue(Of JenisIzin)("JenisIzinID", fJenisIzinID, value)
            End Set
        End Property
        Dim fMasterDataJenisPermohonanID As MasterDataJenisPermohonan
        Public Property MasterDataJenisPermohonanID() As MasterDataJenisPermohonan
            Get
                Return fMasterDataJenisPermohonanID
            End Get
            Set(ByVal value As MasterDataJenisPermohonan)
                SetPropertyValue(Of MasterDataJenisPermohonan)("MasterDataJenisPermohonanID", fMasterDataJenisPermohonanID, value)
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
