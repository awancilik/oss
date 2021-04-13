Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SifatIzin
		Inherits XPLiteObject
		Dim fSifatIzinID As Guid
		<Key(true)> _
		Public Property SifatIzinID() As Guid
			Get
				Return fSifatIzinID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("SifatIzinID", fSifatIzinID, value)
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
        Dim fMasterDataSifatID As MasterDataSifat
        Public Property MasterDataSifatID() As MasterDataSifat
            Get
                Return fMasterDataSifatID
            End Get
            Set(ByVal value As MasterDataSifat)
                SetPropertyValue(Of MasterDataSifat)("MasterDataSifatID", fMasterDataSifatID, value)
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
