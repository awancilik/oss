Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SyaratIzin
		Inherits XPLiteObject
		Dim fSyaratIzinID As Guid
		<Key(true)> _
		Public Property SyaratIzinID() As Guid
			Get
				Return fSyaratIzinID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("SyaratIzinID", fSyaratIzinID, value)
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
        Dim fJenisPermohonanIzinID As JenisPermohonanIzin
        Public Property JenisPermohonanIzinID() As JenisPermohonanIzin
            Get
                Return fJenisPermohonanIzinID
            End Get
            Set(ByVal value As JenisPermohonanIzin)
                SetPropertyValue(Of JenisPermohonanIzin)("JenisPermohonanIzinID", fJenisPermohonanIzinID, value)
            End Set
        End Property
        Dim fMasterDataSyaratID As MasterDataSyarat
        Public Property MasterDataSyaratID() As MasterDataSyarat
            Get
                Return fMasterDataSyaratID
            End Get
            Set(ByVal value As MasterDataSyarat)
                SetPropertyValue(Of MasterDataSyarat)("MasterDataSyaratID", fMasterDataSyaratID, value)
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
