Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SIUPJenis
		Inherits XPLiteObject
		Dim fSIUPJenisID As Guid
		<Key(true)> _
		Public Property SIUPJenisID() As Guid
			Get
				Return fSIUPJenisID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("SIUPJenisID", fSIUPJenisID, value)
			End Set
        End Property
        Dim fJenisPermohonan As JenisPermohonanIzin
        Public Property JenisPermohonan() As JenisPermohonanIzin
            Get
                Return fJenisPermohonan
            End Get
            Set(ByVal value As JenisPermohonanIzin)
                SetPropertyValue(Of JenisPermohonanIzin)("JenisPermohonan", fJenisPermohonan, value)
            End Set
        End Property
        Dim fBentuk As SIUPtBentuk
        <Size(50)> _
        Public Property Bentuk() As SIUPtBentuk
            Get
                Return fBentuk
            End Get
            Set(ByVal value As SIUPtBentuk)
                SetPropertyValue(Of SIUPtBentuk)("Bentuk", fBentuk, value)
            End Set
        End Property
        Dim fSyaratID As MasterDataSyarat
        Public Property SyaratID() As MasterDataSyarat
            Get
                Return fSyaratID
            End Get
            Set(ByVal value As MasterDataSyarat)
                SetPropertyValue(Of MasterDataSyarat)("SyaratID", fSyaratID, value)
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
