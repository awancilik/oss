Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class BAPIMB
		Inherits XPLiteObject
		Dim fBAPID As Guid
		<Key(true)> _
		Public Property BAPID() As Guid
			Get
				Return fBAPID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("BAPID", fBAPID, value)
			End Set
        End Property

        Dim fPermohonanDetailID As PermohonanDetail
        Public Property PermohonanDetailID() As PermohonanDetail
            Get
                Return fPermohonanDetailID
            End Get
            Set(ByVal value As PermohonanDetail)
                SetPropertyValue(Of PermohonanDetail)("PermohonanDetailID", fPermohonanDetailID, value)
            End Set
        End Property

        Dim fIMBID As IMB
        Public Property IMBID() As IMB
            Get
                Return fIMBID
            End Get
            Set(ByVal value As IMB)
                SetPropertyValue(Of IMB)("IMBID", fIMBID, value)
            End Set
        End Property

		Dim fBAPTanggal As DateTime
		Public Property BAPTanggal() As DateTime
			Get
				Return fBAPTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("BAPTanggal", fBAPTanggal, value)
			End Set
        End Property

        Dim fBAPTanggalSelesai As DateTime
        Public Property BAPTanggalSelesai() As DateTime
            Get
                Return fBAPTanggalSelesai
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("BAPTanggalSelesai", fBAPTanggalSelesai, value)
            End Set
        End Property
        
        Dim fStatus As Boolean
        Public Property Status() As Boolean
            Get
                Return fStatus
            End Get
            Set(ByVal value As Boolean)
                SetPropertyValue(Of Boolean)("Status", fStatus, value)
            End Set
        End Property

        Dim fBAPKondisiJalan As String
        <Size(150)> _
        Public Property BAPKondisiJalan() As String
            Get
                Return fBAPKondisiJalan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPKondisiJalan", fBAPKondisiJalan, value)
            End Set
        End Property
        Dim fBAPKelasJalan As String
        <Size(150)> _
        Public Property BAPKelasJalan() As String
            Get
                Return fBAPKelasJalan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPKelasJalan", fBAPKelasJalan, value)
            End Set
        End Property
        Dim fBAPStrukturJalan As String
        Public Property BAPStrukturJalan() As String
            Get
                Return fBAPStrukturJalan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPStrukturJalan", fBAPStrukturJalan, value)
            End Set
        End Property
        Dim fBAPLebarBadanJalan As Decimal
        Public Property BAPLebarBadanJalan() As Decimal
            Get
                Return fBAPLebarBadanJalan
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("BAPLebarBadanJalan", fBAPLebarBadanJalan, value)
            End Set
        End Property
        Dim fBAPLebarDAMIJA As Decimal
        Public Property BAPLebarDAMIJA() As Decimal
            Get
                Return fBAPLebarDAMIJA
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("BAPLebarDAMIJA", fBAPLebarDAMIJA, value)
            End Set
        End Property
        Dim fBAPKondisiTanah As String
        <Size(150)> _
        Public Property BAPKondisiTanah() As String
            Get
                Return fBAPKondisiTanah
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPKondisiTanah", fBAPKondisiTanah, value)
            End Set
        End Property
        Dim fBAPTopografi As String
        <Size(10)> _
        Public Property BAPTopografi() As String
            Get
                Return fBAPTopografi
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPTopografi", fBAPTopografi, value)
            End Set
        End Property
        Dim fBAPStatusTanah As String
        <Size(15)> _
        Public Property BAPStatusTanah() As String
            Get
                Return fBAPStatusTanah
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPStatusTanah", fBAPStatusTanah, value)
            End Set
        End Property
        Dim fBAPBatasUtara As String
        <Size(150)> _
        Public Property BAPBatasUtara() As String
            Get
                Return fBAPBatasUtara
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPBatasUtara", fBAPBatasUtara, value)
            End Set
        End Property
        Dim fBAPBatasSelatan As String
        <Size(150)> _
        Public Property BAPBatasSelatan() As String
            Get
                Return fBAPBatasSelatan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPBatasSelatan", fBAPBatasSelatan, value)
            End Set
        End Property
        Dim fBAPBatasBarat As String
        <Size(150)> _
        Public Property BAPBatasBarat() As String
            Get
                Return fBAPBatasBarat
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPBatasBarat", fBAPBatasBarat, value)
            End Set
        End Property
        Dim fBAPBatasTimur As String
        <Size(150)> _
        Public Property BAPBatasTimur() As String
            Get
                Return fBAPBatasTimur
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPBatasTimur", fBAPBatasTimur, value)
            End Set
        End Property
        Dim fBAPLetakSaluran As String
        <Size(10)> _
        Public Property BAPLetakSaluran() As String
            Get
                Return fBAPLetakSaluran
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPLetakSaluran", fBAPLetakSaluran, value)
            End Set
        End Property
        Dim fBAPLebarSaluran As Decimal
        Public Property BAPLebarSaluran() As Decimal
            Get
                Return fBAPLebarSaluran
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("BAPLebarSaluran", fBAPLebarSaluran, value)
            End Set
        End Property
        Dim fBAPDalamSaluran As Decimal
        Public Property BAPDalamSaluran() As Decimal
            Get
                Return fBAPDalamSaluran
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("BAPDalamSaluran", fBAPDalamSaluran, value)
            End Set
        End Property
        Dim fBAPStrukturSaluran As String
        <Size(10)> _
        Public Property BAPStrukturSaluran() As String
            Get
                Return fBAPStrukturSaluran
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPStrukturSaluran", fBAPStrukturSaluran, value)
            End Set
        End Property
        Dim fBAPGSB As Decimal
        Public Property BAPGSB() As Decimal
            Get
                Return fBAPGSB
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("BAPGSB", fBAPGSB, value)
            End Set
        End Property
        Dim fBAPGSP As Decimal
        Public Property BAPGSP() As Decimal
            Get
                Return fBAPGSP
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("BAPGSP", fBAPGSP, value)
            End Set
        End Property
        Dim fBAPKDB As Decimal
        Public Property BAPKDB() As Decimal
            Get
                Return fBAPKDB
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("BAPKDB", fBAPKDB, value)
            End Set
        End Property
        Dim fBAPKLB As Decimal
        Public Property BAPKLB() As Decimal
            Get
                Return fBAPKLB
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("BAPKLB", fBAPKLB, value)
            End Set
        End Property
        Dim fBAPPeresapanHujan As String
        <Size(150)> _
        Public Property BAPPeresapanHujan() As String
            Get
                Return fBAPPeresapanHujan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPPeresapanHujan", fBAPPeresapanHujan, value)
            End Set
        End Property
        Dim fBAPLain As String
        <Size(250)> _
        Public Property BAPLain() As String
            Get
                Return fBAPLain
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BAPLain", fBAPLain, value)
            End Set
        End Property

        <Association("BAPIMB-BAPIMBDetail")> _
        Public ReadOnly Property BAPIMBDetail() As XPCollection(Of BAPIMBDetail)
            Get
                Return GetCollection(Of BAPIMBDetail)("BAPIMBDetail")
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
