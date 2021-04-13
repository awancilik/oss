﻿Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TDIMesin
		Inherits XPLiteObject
		Dim fTDIMesinID As Guid
		<Key(true)> _
		Public Property TDIMesinID() As Guid
			Get
				Return fTDIMesinID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TDIMesinID", fTDIMesinID, value)
			End Set
		End Property
        Dim fTDIID As TDI
        Public Property TDIID() As TDI
            Get
                Return fTDIID
            End Get
            Set(ByVal value As TDI)
                SetPropertyValue(Of TDI)("TDIID", fTDIID, value)
            End Set
        End Property
		Dim fDlmNegriImport As String
		<Size(15)> _
		Public Property DlmNegriImport() As String
			Get
				Return fDlmNegriImport
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("DlmNegriImport", fDlmNegriImport, value)
			End Set
		End Property
		Dim fNamaMesin As String
		<Size(50)> _
		Public Property NamaMesin() As String
			Get
				Return fNamaMesin
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NamaMesin", fNamaMesin, value)
			End Set
		End Property
		Dim fJumlah As Integer
		Public Property Jumlah() As Integer
			Get
				Return fJumlah
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("Jumlah", fJumlah, value)
			End Set
        End Property
        Dim fSatuan As String
        Public Property Satuan() As String
            Get
                Return fSatuan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Satuan", fSatuan, value)
            End Set
        End Property
		Dim fKapasitas As Integer
		Public Property Kapasitas() As Integer
			Get
				Return fKapasitas
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("Kapasitas", fKapasitas, value)
			End Set
		End Property
		Dim fSpesifikasi As String
		Public Property Spesifikasi() As String
			Get
				Return fSpesifikasi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Spesifikasi", fSpesifikasi, value)
			End Set
		End Property
		Dim fMerk As String
		<Size(50)> _
		Public Property Merk() As String
			Get
				Return fMerk
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Merk", fMerk, value)
			End Set
		End Property
		Dim fTahun As String
		<Size(4)> _
		Public Property Tahun() As String
			Get
				Return fTahun
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Tahun", fTahun, value)
			End Set
		End Property
		Dim fNegaraAsal As String
		<Size(50)> _
		Public Property NegaraAsal() As String
			Get
				Return fNegaraAsal
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NegaraAsal", fNegaraAsal, value)
			End Set
		End Property
		Dim fHarga As Decimal
		Public Property Harga() As Decimal
			Get
				Return fHarga
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Harga", fHarga, value)
			End Set
		End Property
        Dim fUtamaPembantu As String
        <Size(15)> _
        Public Property UtamaPembantu() As String
            Get
                Return fUtamaPembantu
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("UtamaPembantu", fUtamaPembantu, value)
            End Set
        End Property
        Dim fGuna As String
        Public Property Guna() As String
            Get
                Return fGuna
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Guna", fGuna, value)
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
