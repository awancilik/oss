Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class Kecamatan
		Inherits XPLiteObject
		Dim fKecamatanID As Guid
        <Key(True)> _
              <Association("Kecamatan-Kelurahan")> _
        Public Property KecamatanID() As Guid
            Get
                Return fKecamatanID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("KecamatanID", fKecamatanID, value)
            End Set
        End Property

        Dim fKecamatanKabupatenID As Kabupaten
        <Association("Kabupaten-Kecamatan")> _
        Public Property KecamatanKabupatenID() As Kabupaten
            Get
                Return fKecamatanKabupatenID
            End Get
            Set(ByVal value As Kabupaten)
                SetPropertyValue(Of Kabupaten)("KecamatanKabupatenID", fKecamatanKabupatenID, value)
            End Set
        End Property
		Dim fKecamatanNama As String
		<Size(50)> _
		Public Property KecamatanNama() As String
			Get
				Return fKecamatanNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("KecamatanNama", fKecamatanNama, value)
			End Set
		End Property
		Dim fKecamatanKepala As String
		<Size(50)> _
		Public Property KecamatanKepala() As String
			Get
				Return fKecamatanKepala
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("KecamatanKepala", fKecamatanKepala, value)
			End Set
        End Property
        <Association("Kecamatan-Kelurahan")> _
        Public ReadOnly Property Kelurahan() As XPCollection(Of Kelurahan)
            Get
                Return GetCollection(Of Kelurahan)("Kelurahan")
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
