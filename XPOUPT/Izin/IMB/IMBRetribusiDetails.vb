Imports System
Imports DevExpress.Xpo

Namespace OSS

	Public Class IMBRetribusiDetails
        Inherits XPLiteObject

		Dim fRow_id As Guid
		<Key(true)> _
		Public Property Row_id() As Guid
			Get
				Return fRow_id
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("Row_id", fRow_id, value)
			End Set
        End Property

		Dim fNamaBangunan As String
		<Size(50)> _
		Public Property NamaBangunan() As String
			Get
				Return fNamaBangunan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NamaBangunan", fNamaBangunan, value)
			End Set
		End Property

        Dim fimbid As IMBRetribusi
        <Association("IMBRETRIBUSI-IMBRETRIBUSIDETAILS")> _
        Public Property RetribusiId() As IMBRetribusi
            Get
                Return fimbid
            End Get
            Set(ByVal value As IMBRetribusi)
                SetPropertyValue(Of IMBRetribusi)("RetribusiId", fimbid, value)
            End Set
        End Property

        Dim fHDUmum As Decimal
		Public Property HDUmum() As Decimal
			Get
				Return fHDUmum
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("HDUmum", fHDUmum, value)
			End Set
        End Property

        Dim fHDUmumJML As Decimal
        Public Property HDUmumJML() As Decimal
            Get
                Return fHDUmumJML
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("HDUmumJML", fHDUmumJML, value)
            End Set
        End Property

		Dim fHDLain As Decimal
		Public Property HDLain() As Decimal
			Get
				Return fHDLain
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("HDLain", fHDLain, value)
			End Set
        End Property

        Dim fHDLainJML As Decimal
        Public Property HDLainJML() As Decimal
            Get
                Return fHDLainJML
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("HDLainJML", fHDLainJML, value)
            End Set
        End Property

        Dim ftotal As Decimal
        Public ReadOnly Property Total() As Decimal
            Get
                Return ftotal
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
