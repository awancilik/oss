Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPIPemeriksaan
		Inherits XPLiteObject
		Dim fIPIPemeriksaanID As Guid
		<Key(true)> _
		Public Property IPIPemeriksaanID() As Guid
			Get
				Return fIPIPemeriksaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IPIPemeriksaanID", fIPIPemeriksaanID, value)
			End Set
		End Property
        Dim fPermohonanID As Permohonan
        Public Property PermohonanID() As Permohonan
            Get
                Return fPermohonanID
            End Get
            Set(ByVal value As Permohonan)
                SetPropertyValue(Of Permohonan)("PermohonanID", fPermohonanID, value)
            End Set
        End Property
        Dim fIPIID As IPI
        Public Property IPIID() As IPI
            Get
                Return fIPIID
            End Get
            Set(ByVal value As IPI)
                SetPropertyValue(Of IPI)("IPIID", fIPIID, value)
            End Set
        End Property
		Dim fIPIPemeriksaanNomor As String
		<Size(50)> _
		Public Property IPIPemeriksaanNomor() As String
			Get
				Return fIPIPemeriksaanNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IPIPemeriksaanNomor", fIPIPemeriksaanNomor, value)
			End Set
		End Property
		Dim fIPIPemeriksaanTanggal As DateTime
		Public Property IPIPemeriksaanTanggal() As DateTime
			Get
				Return fIPIPemeriksaanTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("IPIPemeriksaanTanggal", fIPIPemeriksaanTanggal, value)
			End Set
        End Property
        Dim fTanggalTerbilang As String
        Public Property TanggalTerbilang() As String
            Get
                Return fTanggalTerbilang
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("TanggalTerbilang", fTanggalTerbilang, value)
            End Set
        End Property
        <Association("IPIPemeriksaan-IPIPemeriksaanDetail")> _
       Public ReadOnly Property IPIPemeriksaanDetail() As XPCollection(Of IPIPemeriksaanDetail)
            Get
                Return GetCollection(Of IPIPemeriksaanDetail)("IPIPemeriksaanDetail")
            End Get
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
