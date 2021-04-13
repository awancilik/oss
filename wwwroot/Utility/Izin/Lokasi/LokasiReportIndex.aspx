<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="LokasiReportIndex.aspx.vb" Inherits="Utility_Izin_LokasiReportIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>
        Lokasi Report Index
    </h1>
    <div class="main_menu">
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton" runat="server" PostBackUrl="~/report/parameterPage/Lokasi/KeputusanParameter.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan IMB" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Keputusan Lokasi</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat keputusan Izin Lokasi<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/report/parameterPage/Lokasi/PetikanLokasi.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan IMB" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Petikan Lokasi</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat Petikan Izin Lokasi<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
        </div>
        <div class="clearfix container">
            <div class="left clearfix">
                <asp:LinkButton ID="PenerbitanIzinLinkButton" runat="server" PostBackUrl="~/report/parameterPage/Lokasi/JmlIzinLokasi.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan Penerbitan Izin Lokasi</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan penerbitan Izin Lokasi<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>
            <%--<div class="left clearfix">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/report/parameterPage/Lokasi/RetribusiBulananLokasi.aspx">
                    <div class="inner_left image">
                        <img alt="Laporan stock Barang" src="../../../gambar/Icon/laporan.gif" style="border:none;"/>
                    </div>
                    <div class="inner_left text">
                        <span class="header_text">Laporan Retribusi Lokasi</span>
                        <span class="ket_text">
                            Berfungsi untuk melihat Laporan Retribusi Izin Lokasi<br />
                        </span>
                    </div> 
                </asp:LinkButton>
            </div>--%>
        </div>
    </div>
</asp:Content>
