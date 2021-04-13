Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class Kelurahan
		Inherits XPLiteObject
		Dim fKelurahanID As Guid
		<Key(true)> _
		Public Property KelurahanID() As Guid
			Get
				Return fKelurahanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("KelurahanID", fKelurahanID, value)
			End Set
        End Property

        Dim fKelurahanKecamatanID As Kecamatan
        <Association("Kecamatan-Kelurahan")> _
        Public Property KelurahanKecamatanID() As Kecamatan
            Get
                Return fKelurahanKecamatanID
            End Get
            Set(ByVal value As Kecamatan)
                SetPropertyValue(Of Kecamatan)("KelurahanKecamatanID", fKelurahanKecamatanID, value)
            End Set
        End Property
		Dim fKelurahanNama As String
		<Size(50)> _
		Public Property KelurahanNama() As String
			Get
				Return fKelurahanNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("KelurahanNama", fKelurahanNama, value)
			End Set
		End Property
		Dim fKelurahanKepala As String
		<Size(50)> _
		Public Property KelurahanKepala() As String
			Get
				Return fKelurahanKepala
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("KelurahanKepala", fKelurahanKepala, value)
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
