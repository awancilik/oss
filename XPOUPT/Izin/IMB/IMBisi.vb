Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IMBbahan
		Inherits XPLiteObject
		Dim fBahan As String
		<Size(30)> _
		Public Property Bahan() As String
			Get
				Return fBahan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Bahan", fBahan, value)
			End Set
		End Property
		Dim fSatuan As String
		<Size(10)> _
		Public Property Satuan() As String
			Get
				Return fSatuan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Satuan", fSatuan, value)
			End Set
		End Property
		Dim fBahanID As Guid
		<Key(true)> _
		Public Property BahanID() As Guid
			Get
				Return fBahanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("BahanID", fBahanID, value)
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

	Public Class IMBtipeHitung
		Inherits XPLiteObject
		Dim fTipe As Byte
		<Key()> _
		Public Property Tipe() As Byte
			Get
				Return fTipe
			End Get
			Set(ByVal value As Byte)
				SetPropertyValue(Of Byte)("Tipe", fTipe, value)
			End Set
		End Property
		Dim fTipeHitung As String
		<Size(50)> _
		Public Property TipeHitung() As String
			Get
				Return fTipeHitung
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TipeHitung", fTipeHitung, value)
			End Set
		End Property
		Dim fKoefisien As Single
		Public Property Koefisien() As Single
			Get
				Return fKoefisien
			End Get
			Set(ByVal value As Single)
				SetPropertyValue(Of Single)("Koefisien", fKoefisien, value)
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

	Public Class IMBsarana
		Inherits XPLiteObject
		Dim fSaranaID As IMBbahan
		<Key(true)> _
		Public Property SaranaID() As IMBbahan
			Get
				Return fSaranaID
			End Get
			Set(ByVal value As IMBbahan)
				SetPropertyValue(Of IMBbahan)("SaranaID", fSaranaID, value)
			End Set
		End Property
		Dim fNoIjin As String
		<Size(30)> _
		Public Property NoIjin() As String
			Get
				Return fNoIjin
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NoIjin", fNoIjin, value)
			End Set
		End Property
		Dim fBahanID As Guid
		Public Property BahanID() As Guid
			Get
				Return fBahanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("BahanID", fBahanID, value)
			End Set
		End Property
		Dim fKeterangan As String
		<Size(30)> _
		Public Property Keterangan() As String
			Get
				Return fKeterangan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Keterangan", fKeterangan, value)
			End Set
		End Property
		Dim fJumlah As Single
		Public Property Jumlah() As Single
			Get
				Return fJumlah
			End Get
			Set(ByVal value As Single)
				SetPropertyValue(Of Single)("Jumlah", fJumlah, value)
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

	Public Class IMBpelaksana
		Inherits XPLiteObject
		Dim fPelaksanaID As Guid
		<Key(true)> _
		Public Property PelaksanaID() As Guid
			Get
				Return fPelaksanaID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PelaksanaID", fPelaksanaID, value)
			End Set
		End Property
		Dim fPelaksana As String
		<Size(20)> _
		Public Property Pelaksana() As String
			Get
				Return fPelaksana
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Pelaksana", fPelaksana, value)
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

	Public Class IMBtujuan
		Inherits XPLiteObject
		Dim fTujuanIMB As String
		<Size(20)> _
		Public Property TujuanIMB() As String
			Get
				Return fTujuanIMB
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TujuanIMB", fTujuanIMB, value)
			End Set
		End Property
		Dim fTujuanID As Guid
		<Key(true)> _
		Public Property TujuanID() As Guid
			Get
				Return fTujuanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TujuanID", fTujuanID, value)
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

	Public Class IMBbangunan
		Inherits XPLiteObject
		Dim fJenisBangunan As String
		<Size(30)> _
		Public Property JenisBangunan() As String
			Get
				Return fJenisBangunan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisBangunan", fJenisBangunan, value)
			End Set
		End Property
		Dim fJenisBangunanID As Guid
		<Key(true)> _
		Public Property JenisBangunanID() As Guid
			Get
				Return fJenisBangunanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("JenisBangunanID", fJenisBangunanID, value)
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
