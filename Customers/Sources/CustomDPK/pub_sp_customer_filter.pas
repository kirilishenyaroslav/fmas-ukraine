unit pub_sp_customer_filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxControls, cxContainer, cxEdit, cxCheckBox, StdCtrls,
  cxButtons, cxDropDownEdit, cxCalendar, ActnList, cxMRUEdit,UConfigApp;

type
  TfrmCustomerFilter = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    FilterProductGroup: TGroupBox;
    CheckCustTitle: TcxCheckBox;
    CheckCustCode: TcxCheckBox;
    GroupBox1: TGroupBox;
    CheckCustNNSDate: TcxCheckBox;
    CheckCustNNSNum: TcxCheckBox;
    GroupBox2: TGroupBox;
    CheckCustBank: TcxCheckBox;
    CheckCustAccType: TcxCheckBox;
    CheckCustAccNum: TcxCheckBox;
    cxButton3: TcxButton;
    CheckCustIsFiz: TcxCheckBox;
    FilterCustomerNNSDate: TcxDateEdit;
    CheckCustPDV: TcxCheckBox;
    CheckCustPNP: TcxCheckBox;
    FilterCustBank: TcxButtonEdit;
    FilterCustAccType: TcxButtonEdit;
    CheckCustPodNum: TcxCheckBox;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    FilterCustTitle: TcxComboBox;
    FilterCustCode: TcxComboBox;
    FilterCustAccNum: TcxComboBox;
    FIlterCustomerNNSNum: TcxComboBox;
    FilterCustPodNum: TcxComboBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure CheckCustTitleClick(Sender: TObject);
    procedure CheckCustCodeClick(Sender: TObject);
    procedure FilterCustAccNumClick(Sender: TObject);
    procedure CheckCustNNSNumClick(Sender: TObject);
    procedure CheckCustNNSDateClick(Sender: TObject);
    procedure CheckCustBankClick(Sender: TObject);
    procedure CheckCustAccTypeClick(Sender: TObject);
    procedure CheckCustAccNumClick(Sender: TObject);
    procedure CheckCustPodNumClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FilterCustTitlePropertiesCloseUp(Sender: TObject);
    procedure FilterCustCodePropertiesCloseUp(Sender: TObject);
    procedure FilterCustAccNumPropertiesCloseUp(Sender: TObject);
    procedure FIlterCustomerNNSNumPropertiesCloseUp(Sender: TObject);
    procedure FilterCustPodNumPropertiesCloseUp(Sender: TObject);
  private

    FCustTitleFilter:string;
    FCustCode       :string;
    FCustNNSNum     :string;
    FCustAccNum     :string;
    FCustNNSDate    :string;
    FCustBank       :string;
    FCustBankId     :string;
    FCustAccType    :string;
    FCustPodNum     :string;
    FCheckCustTitle :string;
    FCheckCustCode  :string;
    FCheckCustNNSDate :string;
    FCheckCustNNSNum  :string;
    FCheckCustBank    :string;
    FCheckCustAccType :string;
    FCheckCustAccNum  :string;
    FCheckCustIsFiz   :string;
    FCheckCustIzFactory :string;
    FCheckCustPDV       :string;
    FCheckCustPNP       :string;
    FCheckCustPodNum    :string;

    FCustTitleList      :TListValStr;
    FCustCodeList       :TListValStr;
    FCustAccNumList     :TListValStr;
    FCustPodNumList     :TListValStr;

  published
    property CustTitleList  :TListValStr read FCustTitleList    write FCustTitleList;
    property CustCodeList   :TListValStr read FCustCodeList     write FCustCodeList;
    property CustAccNumList :TListValStr read FCustAccNumList   write FCustAccNumList;
    property CustPodNumList :TListValStr read FCustPodNumList   write FCustPodNumList;

    property CustTitleFilter:string read FCustTitleFilter write FCustTitleFilter;
    property CustCode       :string read FCustCode        write FCustCode;
    property CustNNSNum     :string read FCustNNSNum      write FCustNNSNum;
    property CustAccNum     :string read FCustAccNum      write FCustAccNum;
    property CustNNSDate    :string read FCustNNSDate     write FCustNNSDate;
    property CustBank       :string read FCustBank        write FCustBank;
    property CustBankId     :string read FCustBankId      write FCustBankId;
    property CustAccType    :string read FCustAccType     write FCustAccType;
    property CustPodNum     :string read FCustPodNum      write FCustPodNum;

    property PFCheckCustTitle     :string      read FCheckCustTitle      write FCheckCustTitle;
    property PFCheckCustCode      :string      read FCheckCustCode       write FCheckCustCode;
    property PFCheckCustNNSDate   :string      read FCheckCustNNSDate    write FCheckCustNNSDate;
    property PFCheckCustNNSNum    :string      read FCheckCustNNSNum     write FCheckCustNNSNum;
    property PFCheckCustBank      :string      read FCheckCustBank       write FCheckCustBank;
    property PFCheckCustAccType   :string      read FCheckCustAccType    write FCheckCustAccType;
    property PFCheckCustAccNum    :string      read FCheckCustAccNum     write FCheckCustAccNum;
    property PFCheckCustIsFiz     :string      read FCheckCustIsFiz      write FCheckCustIsFiz;
    property PFCheckCustIzFactory :string      read FCheckCustIzFactory  write FCheckCustIzFactory;
    property PFCheckCustPDV       :string      read FCheckCustPDV        write FCheckCustPDV;
    property PFCheckCustPNP       :string      read FCheckCustPNP        write FCheckCustPNP;
    property PFCheckCustPodNum    :string      read FCheckCustPodNum     write FCheckCustPodNum;

  public
    { Public declarations }
  end;

  var GlobalCustomerFilter:TfrmCustomerFilter;

implementation



{$R *.dfm}

procedure TfrmCustomerFilter.cxButton1Click(Sender: TObject);
begin
        if CheckCustTitle.Checked and (FilterCustTitle.Text='')
        then begin
           CheckCustTitle.Checked:=false;
           CheckCustTitle.OnClick(self);
        end
        else UConfigApp.SetLookupListValues(FilterCustTitle);

        if CheckCustCode.Checked and (FilterCustCode.Text='')
        then begin
           CheckCustCode.Checked:=false;
           CheckCustCode.OnClick(self);
        end
        else UConfigApp.SetLookupListValues(FilterCustCode);



        if CheckCustNNSNum.Checked and (FIlterCustomerNNSNum.Text='')
        then begin
           CheckCustNNSNum.Checked:=false;
           CheckCustNNSNum.OnClick(self);
        end
        else UConfigApp.SetLookupListValues(FIlterCustomerNNSNum);

        if CheckCustBank.Checked and (FilterCustBank.Text='')
        then begin
           CheckCustBank.Checked:=false;
           CheckCustBank.OnClick(self);
        end;

        if CheckCustAccType.Checked and (FilterCustAccType.Text='')
        then begin
           CheckCustAccType.Checked:=false;
           CheckCustAccType.OnClick(self);
        end;

        if CheckCustAccNum.Checked and (FilterCustAccNum.Text='')
        then begin
           CheckCustAccNum.Checked:=false;
           CheckCustAccNum.OnClick(self);
        end;

        if CheckCustPodNum.Checked and (FilterCustPodNum.Text='')
        then begin
           CheckCustPodNum.Checked:=false;
           CheckCustPodNum.OnClick(self);
        end
        else UConfigApp.SetLookupListValues(FilterCustPodNum);

        ModalResult:=mrYes;
end;

procedure TfrmCustomerFilter.cxButton2Click(Sender: TObject);
begin
    ModalResult:=mrNo;
end;

procedure TfrmCustomerFilter.CheckCustTitleClick(Sender: TObject);
begin
     if CheckCustTitle.Checked
     then begin
          FilterCustTitle.Enabled:=true;
          FilterCustTitle.Style.Color:=clInfoBk;
          if self.Showing then FilterCustTitle.SetFocus;
     end
     else begin
          FilterCustTitle.Enabled:=false;
          FilterCustTitle.Style.Color:=clMenu;
     end;
end;

procedure TfrmCustomerFilter.CheckCustCodeClick(Sender: TObject);
begin
     if CheckCustCode.Checked
     then begin
          FilterCustCode.Enabled:=true;
          FilterCustCode.Style.Color:=clInfoBk;
          if self.Showing then  FilterCustCode.SetFocus;
     end
     else begin
          FilterCustCode.Enabled:=false;
          FilterCustCode.Style.Color:=clMenu;
     end;

end;

procedure TfrmCustomerFilter.FilterCustAccNumClick(Sender: TObject);
begin
     if CheckCustAccNum.Checked
     then begin
          FilterCustAccNum.Enabled:=true;
          FilterCustAccNum.Style.Color:=clInfoBk;
          if self.Showing then FilterCustAccNum.SetFocus;
     end
     else begin
          FilterCustAccNum.Enabled:=false;
          FilterCustAccNum.Style.Color:=clMenu;
     end;

end;

procedure TfrmCustomerFilter.CheckCustNNSNumClick(Sender: TObject);
begin
     if CheckCustNNSNum.Checked
     then begin
          FIlterCustomerNNSNum.Enabled:=true;
          FIlterCustomerNNSNum.Style.Color:=clInfoBk;
          if self.Showing then FIlterCustomerNNSNum.SetFocus;
     end
     else begin
          FIlterCustomerNNSNum.Enabled:=false;
          FIlterCustomerNNSNum.Style.Color:=clMenu;
     end;

end;

procedure TfrmCustomerFilter.CheckCustNNSDateClick(Sender: TObject);
begin
     if CheckCustNNSDate.Checked
     then begin
          FilterCustomerNNSDate.Enabled:=true;
          FilterCustomerNNSDate.Style.Color:=clInfoBk;
          if self.Showing then FilterCustomerNNSDate.SetFocus;
     end
     else begin
          FilterCustomerNNSDate.Enabled:=false;
          FilterCustomerNNSDate.Style.Color:=clMenu;
     end;
end;

procedure TfrmCustomerFilter.CheckCustBankClick(Sender: TObject);
begin
     if CheckCustBank.Checked
     then begin
          FilterCustBank.Enabled:=true;
          FilterCustBank.Style.Color:=clInfoBk;
          if self.Showing then FilterCustBank.SetFocus;
     end
     else begin
          FilterCustBank.Enabled:=false;
          FilterCustBank.Style.Color:=clMenu;
     end;

end;

procedure TfrmCustomerFilter.CheckCustAccTypeClick(Sender: TObject);
begin
     if CheckCustAccType.Checked
     then begin
          FilterCustAccType.Enabled:=true;
          FilterCustAccType.Style.Color:=clInfoBk;
          if self.Showing then FilterCustAccType.SetFocus;
     end
     else begin
          FilterCustAccType.Enabled:=false;
          FilterCustAccType.Style.Color:=clMenu;
     end;

end;

procedure TfrmCustomerFilter.CheckCustAccNumClick(Sender: TObject);
begin
     if CheckCustAccNum.Checked
     then begin
          FilterCustAccNum.Enabled:=true;
          FilterCustAccNum.Style.Color:=clInfoBk;
          if self.Showing then FilterCustAccNum.SetFocus;
     end
     else begin
          FilterCustAccNum.Enabled:=false;
          FilterCustAccNum.Style.Color:=clMenu;
     end;

end;

procedure TfrmCustomerFilter.CheckCustPodNumClick(Sender: TObject);
begin
     if CheckCustPodNum.Checked
     then begin
          FilterCustPodNum.Enabled:=true;
          FilterCustPodNum.Style.Color:=clInfoBk;
          if self.Showing then FilterCustPodNum.SetFocus;
     end
     else begin
          FilterCustPodNum.Enabled:=false;
          FilterCustPodNum.Style.Color:=clMenu;
     end;
end;

procedure TfrmCustomerFilter.cxButton3Click(Sender: TObject);
begin
        CheckCustTitle.Checked:=false;
        CheckCustCode.Checked:=false;
        CheckCustNNSDate.Checked:=false;
        CheckCustNNSNum.Checked:=false;
        CheckCustBank.Checked:=false;
        CheckCustAccType.Checked:=false;
        CheckCustAccNum.Checked:=false;
        CheckCustIsFiz.Checked:=false;
        CheckCustIzFactory.Checked:=false;
        CheckCustPDV.Checked:=false;
        CheckCustPNP.Checked:=false;
        CheckCustPodNum.Checked:=false;

        CheckCustTitle.OnClick(self);
        CheckCustCode.OnClick(self);
        CheckCustNNSDate.OnClick(self);
        CheckCustNNSNum.OnClick(self);
        CheckCustBank.OnClick(self);
        CheckCustAccType.OnClick(self);
        CheckCustAccNum.OnClick(self);
        CheckCustPodNum.OnClick(self);
end;

procedure TfrmCustomerFilter.FormCreate(Sender: TObject);
begin
        FilterCustomerNNSDate.Date:=Date;
        ReadWriteIni(Self, False);
        FilterCustTitle.Text       :=FCustTitleFilter;
        FilterCustCode.Text        :=FCustCode;
        FIlterCustomerNNSNum.Text  :=FCustNNSNum;
        FilterCustAccNum.Text      :=FCustAccNum;
        FilterCustomerNNSDate.Text :=FCustNNSDate;
        FilterCustBank.Text        :=FCustBank;
        FilterCustAccType.Text     :=FCustAccType;
        FilterCustPodNum.Text      :=FCustPodNum;

        CheckCustTitle.Checked     :=Boolean(StrToInt(FCheckCustTitle));
        if CheckCustTitle.Checked
        then if Assigned(CheckCustTitle.OnClick) then CheckCustTitle.OnClick(self);

        CheckCustCode.Checked      :=Boolean(StrToInt(FCheckCustCode));
        if CheckCustCode.Checked
        then if Assigned(CheckCustCode.OnClick) then CheckCustCode.OnClick(self);

        CheckCustNNSDate.Checked   :=Boolean(StrToInt(FCheckCustNNSDate));
        if CheckCustNNSDate.Checked
        then if Assigned(CheckCustNNSDate.OnClick) then CheckCustNNSDate.OnClick(self);

        CheckCustNNSNum.Checked    :=Boolean(StrToInt(FCheckCustNNSNum));
        if CheckCustNNSNum.Checked
        then if Assigned(CheckCustNNSNum.OnClick) then CheckCustNNSNum.OnClick(self);

        CheckCustBank.Checked      :=Boolean(StrToInt(FCheckCustBank));
        if CheckCustBank.Checked
        then if Assigned(CheckCustBank.OnClick) then CheckCustBank.OnClick(self);

        CheckCustAccType.Checked   :=Boolean(StrToInt(FCheckCustAccType));
        if CheckCustAccType.Checked
        then if Assigned(CheckCustAccType.OnClick) then CheckCustAccType.OnClick(self);

        CheckCustAccNum.Checked    :=Boolean(StrToInt(FCheckCustAccNum));
        if CheckCustAccNum.Checked
        then if Assigned(CheckCustAccNum.OnClick) then CheckCustAccNum.OnClick(self);

        CheckCustIsFiz.Checked     :=Boolean(StrToInt(FCheckCustIsFiz));
        if CheckCustIsFiz.Checked
        then if Assigned(CheckCustIsFiz.OnClick) then CheckCustIsFiz.OnClick(self);

        CheckCustIzFactory.Checked :=Boolean(StrToInt(FCheckCustIzFactory));
        if CheckCustIzFactory.Checked
        then if Assigned(CheckCustIzFactory.OnClick) then CheckCustIzFactory.OnClick(self);

        CheckCustPDV.Checked       :=Boolean(StrToInt(FCheckCustPDV));
        if CheckCustPDV.Checked
        then if Assigned(CheckCustPDV.OnClick) then CheckCustPDV.OnClick(self);

        CheckCustPNP.Checked       :=Boolean(StrToInt(FCheckCustPNP));
        if CheckCustPNP.Checked
        then if Assigned(CheckCustPNP.OnClick) then CheckCustPNP.OnClick(self);

        CheckCustPodNum.Checked    :=Boolean(StrToInt(FCheckCustPodNum));
        if CheckCustPodNum.Checked
        then if Assigned(CheckCustPodNum.OnClick) then CheckCustPodNum.OnClick(self);

        UConfigApp.GetLookupListValues(FilterCustTitle,FCustTitleList);
        UConfigApp.GetLookupListValues(FilterCustCode,FCustCodeList);
        UConfigApp.GetLookupListValues(FilterCustAccNum,FCustAccNumList);
        UConfigApp.GetLookupListValues(FilterCustPodNum,FCustPodNumList);


end;

procedure TfrmCustomerFilter.Action1Execute(Sender: TObject);
begin
   cxButton1Click(self);
end;

procedure TfrmCustomerFilter.Action2Execute(Sender: TObject);
begin
    ModalResult:=mrNo;
end;


procedure TfrmCustomerFilter.FormDestroy(Sender: TObject);
begin
    CustTitleFilter:=FilterCustTitle.Text           ;
    CustCode       :=    FilterCustCode.Text        ;
    CustNNSNum     :=    FIlterCustomerNNSNum.Text  ;
    CustAccNum     :=    FilterCustAccNum.Text      ;
    CustNNSDate    :=    FilterCustomerNNSDate.Text ;
    CustBank       :=    FilterCustBank.Text        ;
    CustAccType    :=    FilterCustAccType.Text     ;
    CustPodNum     :=    FilterCustPodNum.Text      ;

    PFCheckCustTitle      :=IntToStr(Integer(CheckCustTitle.Checked));
    PFCheckCustCode       :=IntToStr(Integer(CheckCustCode.Checked));
    PFCheckCustNNSDate    :=IntToStr(Integer(CheckCustNNSDate.Checked));
    PFCheckCustNNSNum     :=IntToStr(Integer(CheckCustNNSNum.Checked));
    PFCheckCustBank       :=IntToStr(Integer(CheckCustBank.Checked));
    PFCheckCustAccType    :=IntToStr(Integer(CheckCustAccType.Checked));
    PFCheckCustAccNum     :=IntToStr(Integer(CheckCustAccNum.Checked));
    PFCheckCustIsFiz      :=IntToStr(Integer(CheckCustIsFiz.Checked));
    PFCheckCustIzFactory  :=IntToStr(Integer(CheckCustIzFactory.Checked));
    PFCheckCustPDV        :=IntToStr(Integer(CheckCustPDV.Checked));
    PFCheckCustPNP        :=IntToStr(Integer(CheckCustPNP.Checked));
    PFCheckCustPodNum     :=IntToStr(Integer(CheckCustPodNum.Checked));


    UConfigApp.DumpLookupListValues(FilterCustTitle,FCustTitleList);
    UConfigApp.DumpLookupListValues(FilterCustCode,FCustCodeList);
    UConfigApp.DumpLookupListValues(FilterCustAccNum,FCustAccNumList);
    UConfigApp.DumpLookupListValues(FilterCustPodNum,FCustPodNumList);

    ReadWriteIni(Self, True);
end;


procedure TfrmCustomerFilter.FilterCustTitlePropertiesCloseUp(
  Sender: TObject);
begin
  if (FilterCustTitle.ItemIndex>=0)
  then begin
     FilterCustTitle.Text:=FilterCustTitle.Properties.Items[FilterCustTitle.ItemIndex];
  end;
end;

procedure TfrmCustomerFilter.FilterCustCodePropertiesCloseUp(
  Sender: TObject);
begin
  if (FilterCustCode.ItemIndex>=0)
  then begin
     FilterCustCode.Text:=FilterCustCode.Properties.Items[FilterCustCode.ItemIndex];
  end;

end;

procedure TfrmCustomerFilter.FilterCustAccNumPropertiesCloseUp(
  Sender: TObject);
begin
  if (FilterCustAccNum.ItemIndex>=0)
  then begin
     FilterCustAccNum.Text:=FilterCustAccNum.Properties.Items[FilterCustAccNum.ItemIndex];
  end;

end;

procedure TfrmCustomerFilter.FIlterCustomerNNSNumPropertiesCloseUp(
  Sender: TObject);
begin
  if (FIlterCustomerNNSNum.ItemIndex>=0)
  then begin
     FIlterCustomerNNSNum.Text:=FIlterCustomerNNSNum.Properties.Items[FIlterCustomerNNSNum.ItemIndex];
  end;
end;

procedure TfrmCustomerFilter.FilterCustPodNumPropertiesCloseUp(
  Sender: TObject);
begin
  if (FilterCustPodNum.ItemIndex>=0)
  then begin
     FilterCustPodNum.Text:=FilterCustPodNum.Properties.Items[FilterCustPodNum.ItemIndex];
  end;
end;

end.

