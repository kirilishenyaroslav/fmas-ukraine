unit FindForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, cxCalc, cxButtonEdit, cxMaskEdit,
  cxLabel, cxTextEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer,
  cxEdit, cxCheckBox, DB, FIBDataSet, pFIBDataSet, cxMemo,ConstClBank,DogLoaderUnit,
  GlobalSPR,LoadDogManedger,Registry;

type
  TfrmFindForm = class(TForm)
    GroupBoxFind: TGroupBox;
    cxCheckBoxNumberDoc: TcxCheckBox;
    cxCheckBoxCustomer: TcxCheckBox;
    GroupBoxCustomer: TGroupBox;
    cxButtonEditCustomer: TcxButtonEdit;
    cxCheckBoxDatevip: TcxCheckBox;
    cxCheckBoxPrR: TcxCheckBox;
    cxCheckBoxSumma: TcxCheckBox;
    cxRadioGroupPrR: TRadioGroup;
    ButtonFind: TButton;
    pFIBDataSet_post: TpFIBDataSet;
    cxMaskEditNumberDoc: TcxMaskEdit;
    cxCheckBoxRsNative: TcxCheckBox;
    RadioGroupCustomer: TRadioGroup;
    cxTextEditCustomer: TcxTextEdit;
    cxCheckBoxRsCustom: TcxCheckBox;
    cxCheckBoxnote: TcxCheckBox;
    cxButtonEditRsCustom: TcxButtonEdit;
    cxButtonEditRsNative: TcxButtonEdit;
    cxCheckBoxDatevipBegin: TcxCheckBox;
    cxDateEditBeginVip: TcxDateEdit;
    cxCheckBoxDatevipEnd: TcxCheckBox;
    cxDateEditEndVip: TcxDateEdit;
    cxCheckBoxDate: TcxCheckBox;
    cxCheckBoxDateBegin: TcxCheckBox;
    cxCheckBoxDateEnd: TcxCheckBox;
    cxDateEditBegin: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    cxCheckBoxSummaBegin: TcxCheckBox;
    cxCheckBoxSummaEnd: TcxCheckBox;
    cxCalcEditSummaBegin: TcxCalcEdit;
    cxCalcEditSummaEnd: TcxCalcEdit;
    cxCheckBoxWork: TcxCheckBox;
    RadioGroupWork: TRadioGroup;
    cxCheckBoxDelete: TcxCheckBox;
    cxTextEditNote: TcxTextEdit;
    ButtonClose: TButton;
    procedure cxCheckBoxDatevipClick(Sender: TObject);
    procedure cxCheckBoxNumberDocClick(Sender: TObject);
    procedure cxCheckBoxPrRClick(Sender: TObject);
    procedure cxCheckBoxSummaClick(Sender: TObject);
    procedure cxCheckBoxDateClick(Sender: TObject);
    procedure cxCheckBoxCustomerClick(Sender: TObject);
    procedure cxButtonEditCustomerPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonFindClick(Sender: TObject);
    procedure cxCheckBoxDatevipBeginClick(Sender: TObject);
    procedure cxCheckBoxDatevipEndClick(Sender: TObject);
    procedure cxCheckBoxDateBeginClick(Sender: TObject);
    procedure cxCheckBoxDateEndClick(Sender: TObject);
    procedure cxCheckBoxSummaBeginClick(Sender: TObject);
    procedure cxCheckBoxSummaEndClick(Sender: TObject);
    procedure cxCheckBoxRsNativeClick(Sender: TObject);
    procedure cxCheckBoxRsCustomClick(Sender: TObject);
    procedure cxCheckBoxnoteClick(Sender: TObject);
    procedure RadioGroupCustomerClick(Sender: TObject);
    procedure cxButtonEditRsNativePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditRsCustomPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function DecSeparator:string;
    procedure cxCalcEditSummaBeginKeyPress(Sender: TObject; var Key: Char);
    procedure cxCalcEditSummaEndKeyPress(Sender: TObject; var Key: Char);
    procedure cxCheckBoxWorkClick(Sender: TObject);
    function CheckedFilter: Boolean;
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState); //проверка на корректность
  private
    { Private declarations }
  public
    closeFind:Integer;
    Constructor Create(Aowner:TComponent;paramSearch:Variant);overload;
    function FindClBankDoc():Variant;
    { Public declarations }
  end;

var
  frmFindForm: TfrmFindForm;
  param:Variant;
  id_cust,id_acc_cust:Variant;
  id_acc_native:Variant;
implementation
uses
  MainFormView, Math;
{$R *.dfm}


Constructor TfrmFindForm.Create(Aowner:TComponent;paramSearch:Variant);
var
  i:Integer;
begin
  Inherited Create (Aowner);
  closeFind:=2;
  LoadSysData(TfrmMainFormView(Self.Owner).Transaction);
//load interface
  cxCheckBoxDatevip.Properties.Caption:=ConstClBank.ClBank_date_doc;
  cxCheckBoxDatevipBegin.Properties.Caption:=ConstClBank.ClBank_Begin;
  cxCheckBoxDatevipEnd.Properties.Caption:=ConstClBank.ClBank_End;

  cxCheckBoxDate.Properties.Caption:=ConstClBank.ClBank_date_vip;
  cxCheckBoxDateBegin.Properties.Caption:=ConstClBank.ClBank_Begin;
  cxCheckBoxDateEnd.Properties.Caption:=ConstClBank.ClBank_End;

  cxCheckBoxNumberDoc.Properties.Caption:=ConstClBank.ClBank_number_doc;

  cxCheckBoxSumma.Properties.Caption:=ConstClBank.ClBank_summa;
  cxCheckBoxSummaBegin.Properties.Caption:=ConstClBank.ClBank_Begin;
  cxCheckBoxSummaEnd.Properties.Caption:=ConstClBank.ClBank_End;

  ButtonFind.Caption:=ConstClBank.ClBank_ACTION_FIND;
  ButtonClose.Caption := ConstClBank.ClBank_BUTTON_CANCEL_CONST;

  cxCheckBoxPrR.Properties.Caption:=ConstClBank.ClBank_type_doc;
  cxRadioGroupPrR.Items.Clear;
  cxRadioGroupPrR.Items.Add(ConstClBank.ClBank_prras);
  cxRadioGroupPrR.Items.Add(ConstClBank.ClBank_prihod);
  cxRadioGroupPrR.Items.Add(ConstClBank.ClBank_rashod);
  cxRadioGroupPrR.ItemIndex:=0;
  cxRadioGroupPrR.Enabled:=false;

  cxCheckBoxRsNative.Properties.Caption:=ConstClBank.ClBank_rs_native;
  RadioGroupCustomer.Items.Clear;
  RadioGroupCustomer.Items.Add(ConstClBank.ClBank_From_SPR);
  RadioGroupCustomer.Items.Add(ConstClBank.ClBank_From_text);
  RadioGroupCustomer.ItemIndex:=0;
  RadioGroupCustomer.Enabled:=false;

  cxCheckBoxCustomer.Properties.Caption:=ConstClBank.ClBank_customer;
  cxCheckBoxRsCustom.Properties.Caption:=ConstClBank.ClBank_rs_customer;
  cxCheckBoxnote.Properties.Caption:=ConstClBank.ClBank_note;

  cxCheckBoxWork.Properties.Caption:='Стан документа';
  RadioGroupWork.Items.Clear;
  RadioGroupWork.Items.Add(ConstClBank.ClBank_UNWORK);
  RadioGroupWork.Items.Add(ConstClBank.ClBank_WORK);
  RadioGroupWork.ItemIndex:=0;
  RadioGroupWork.Enabled:=false;

  cxTextEditNote.Text := '';

  param:=paramSearch;
  //для даты выписки документа
  if param[0][0]=1 then
    begin
      cxCheckBoxDatevip.Checked:=true;
      if param[0][1]=1 then
        begin
          cxCheckBoxDatevipBegin.Checked:=true;
          cxCheckBoxDatevipBeginClick(self);
        end
        else
        begin
          cxCheckBoxDatevipBegin.Checked:=false;
          cxCheckBoxDatevipBeginClick(self);
        end;
      if param[0][2]=0 then
        begin
          cxDateEditBeginVip.Date:=Date;
        end
        else
        begin
          cxDateEditBeginVip.Date:=param[0][2];
        end;
      if param[0][3]=1 then
        begin
          cxCheckBoxDatevipEnd.Checked:=true;
          cxCheckBoxDatevipEndClick(self);
        end
        else
        begin
          cxCheckBoxDatevipEnd.Checked:=false;
          cxCheckBoxDatevipEndClick(self);
        end;
      cxCheckBoxDatevipClick(self);
      if param[0][4]=0 then
        begin
          cxDateEditEndVip.Date:=Date;
        end
        else
        begin
          cxDateEditEndVip.Date:=param[0][4];
        end;
    end
    else
    begin
      cxCheckBoxDatevip.Checked:=false;
      cxCheckBoxDatevipClick(self);
      if param[0][2]=0 then
        begin
          cxDateEditBeginVip.Date:=Date;
        end
        else
        begin
          cxDateEditBeginVip.Date:=param[0][2];
        end;
      if param[0][4]=0 then
        begin
          cxDateEditEndVip.Date:=Date;
        end
        else
        begin
          cxDateEditEndVip.Date:=param[0][4];
        end;
    end;
  //для даты документа
  if param[1][0]=1 then
    begin
      cxCheckBoxDate.Checked:=true;
      if param[1][1]=1 then
        begin
          cxCheckBoxDateBegin.Checked:=true;
          cxCheckBoxDateBeginClick(self);
        end
        else
        begin
          cxCheckBoxDateBegin.Checked:=false;
          cxCheckBoxDateBeginClick(self);
        end;
      if param[1][2]=0 then
        begin
          cxDateEditBegin.Date:=Date;
        end
        else
        begin
          cxDateEditBegin.Date:=param[1][2];
        end;
      if param[1][3]=1 then
        begin
          cxCheckBoxDateEnd.Checked:=true;
          cxCheckBoxDateEndClick(self);
        end
        else
        begin
          cxCheckBoxDateEnd.Checked:=false;
          cxCheckBoxDateEndClick(self);
        end;
      cxCheckBoxDateClick(self);
      if param[1][4]=0 then
        begin
          cxDateEditEnd.Date:=Date;
        end
        else
        begin
          cxDateEditEnd.Date:=param[1][4];
        end;
    end
    else
    begin
      cxCheckBoxDate.Checked:=false;
      cxCheckBoxDateClick(self);
      if param[1][2]=0 then
        begin
          cxDateEditBegin.Date:=Date;
        end
        else
        begin
          cxDateEditBegin.Date:=param[1][2];
        end;
      if param[1][4]=0 then
        begin
          cxDateEditEnd.Date:=Date;
        end
        else
        begin
          cxDateEditEnd.Date:=param[1][4];
        end;
    end;
//по номеру документа
  if param[2][0]=1 then
    begin
      cxCheckBoxNumberDoc.Checked:=true;
      cxCheckBoxNumberDocClick(self);
      cxMaskEditNumberDoc.Text:=param[2][1]
    end
    else
    begin
      cxCheckBoxNumberDoc.Checked:=false;
      cxCheckBoxNumberDocClick(self);
      cxMaskEditNumberDoc.Text:=param[2][1]
    end;
//по сумме документа
  if param[3][0]=1 then
    begin
      cxCheckBoxSumma.Checked:=true;
      if param[3][1]=1 then
        begin
          cxCheckBoxSummaBegin.Checked:=true;
          cxCheckBoxSummaBeginClick(self);
        end
        else
        begin
          cxCheckBoxSummaBegin.Checked:=false;
          cxCheckBoxSummaBeginClick(self);
        end;
        cxCalcEditSummaBegin.Text:=param[3][2];
      if param[3][3]=1 then
        begin
          cxCheckBoxSummaEnd.Checked:=true;
          cxCheckBoxSummaEndClick(self);
        end
        else
        begin
          cxCheckBoxSummaEnd.Checked:=false;
          cxCheckBoxSummaEndClick(self);
        end;
      cxCheckBoxSummaClick(self);
      cxCalcEditSummaEnd.Text:=param[3][4];
    end
    else
    begin
      cxCheckBoxSumma.Checked:=false;
      cxCheckBoxSummaClick(self);
      cxCalcEditSummaBegin.Text:=param[3][2];
      cxCalcEditSummaEnd.Text:=param[3][4];
    end;
//по типу документа
  if param[4][0]=1 then
    begin
      cxCheckBoxPrR.Checked:=true;
      cxCheckBoxPrRClick(self);
      cxRadioGroupPrR.ItemIndex:=param[4][1];
    end
    else
    begin
      cxCheckBoxPrR.Checked:=false;
      cxCheckBoxPrRClick(self);
      cxRadioGroupPrR.ItemIndex:=param[4][1];
    end;
// по нашему р/с
  if param[5][0]=1 then
    begin
      cxCheckBoxRsNative.Checked:=true;
      cxCheckBoxRsNativeClick(self);
      cxButtonEditRsNative.Text:=param[5][2];
      id_acc_native:=param[5][1];
    end
    else
    begin
      cxCheckBoxRsNative.Checked:=false;
      cxCheckBoxRsNativeClick(self);
      cxButtonEditRsNative.Text:=param[5][2];
      id_acc_native:=param[5][1];
    end;
//по контрагенту
  if param[6][0]=1 then
    begin
      cxCheckBoxCustomer.Checked:=true;
      cxCheckBoxCustomerClick(self);
      RadioGroupCustomer.ItemIndex:=param[6][1];
      cxButtonEditCustomer.Text:=param[6][3];
      cxTextEditCustomer.Text:=param[6][4];
      id_cust:=param[6][2];
      RadioGroupCustomerClick(self);
    end
    else
    begin
      cxCheckBoxCustomer.Checked:=false;
      cxCheckBoxCustomerClick(self);
      RadioGroupCustomer.ItemIndex:=param[6][1];
      cxButtonEditCustomer.Text:=param[6][3];
      cxTextEditCustomer.Text:=param[6][4];
      id_cust:=param[6][2];
    end;
//по р/с контрагента
  if param[7][0]=1 then
    begin
      cxCheckBoxRsCustom.Checked:=true;
      cxCheckBoxRsCustomClick(self);
      cxButtonEditRsCustom.Text:=param[7][2];
      id_acc_cust:=param[7][1];
    end
    else
    begin
      cxCheckBoxRsCustom.Checked:=false;
      cxCheckBoxRsCustomClick(self);
      cxButtonEditRsCustom.Text:=param[7][2];
      id_acc_cust:=param[7][1];
    end;
//по основанию докумета
  if param[8][0]=1 then
    begin
      cxCheckBoxnote.Checked:=true;
      cxCheckBoxnoteClick(self);
      cxTextEditNote.Text:='';//param[8][1];
    end
    else
    begin
      cxCheckBoxnote.Checked:=false;
      cxCheckBoxnoteClick(self);
      cxTextEditNote.Text:='';//param[8][1];
    end;
//по состоянию
  if param[9][0]=1 then
    begin
      cxCheckBoxWork.Checked:=true;
      cxCheckBoxWorkClick(self);
      RadioGroupWork.ItemIndex:=param[9][1];
    end
    else
    begin
      cxCheckBoxWork.Checked:=false;
      cxCheckBoxWorkClick(self);
      RadioGroupWork.ItemIndex:=param[9][1];
    end;
//по удаленным
  if param[10][1]=1 then
    begin
      cxCheckBoxDelete.Checked:=true;
    end
    else
    begin
      cxCheckBoxDelete.Checked:=false;
    end;
end;

function TfrmFindForm.FindClBankDoc():Variant;
var
  find:TfrmFindForm;
begin
  ShowModal;
  FindClBankDoc:=param;

end;

procedure TfrmFindForm.cxCheckBoxDatevipClick(Sender: TObject);
begin
if cxCheckBoxDatevip.Checked=true then
  begin
    cxCheckBoxDatevipBegin.Enabled:=true;
    cxCheckBoxDatevipEnd.Enabled:=true;
    If cxCheckBoxDatevipBegin.Checked=true then
      begin
        cxDateEditBeginVip.Enabled:=true;
      end;
    If cxCheckBoxDatevipEnd.Checked=true then
      begin
        cxDateEditEndVip.Enabled:=true;
      end;
  end
  else
  begin
    cxCheckBoxDatevipBegin.Enabled:=false;
    cxCheckBoxDatevipEnd.Enabled:=false;
    cxDateEditBeginVip.Enabled:=false;
    cxDateEditEndVip.Enabled:=false;
  end;
end;

procedure TfrmFindForm.cxCheckBoxNumberDocClick(Sender: TObject);
begin
if cxCheckBoxNumberDoc.Checked=true then
  begin
    cxMaskEditNumberDoc.Enabled:=true;
  end
  else
  begin
    cxMaskEditNumberDoc.Enabled:=false;
  end;
end;

procedure TfrmFindForm.cxCheckBoxPrRClick(Sender: TObject);
begin
if cxCheckBoxPrR.Checked=true then
  begin
    cxRadioGroupPrR.Enabled:=true;
  end
  else
  begin
    cxRadioGroupPrR.Enabled:=false;
  end;
end;

procedure TfrmFindForm.cxCheckBoxSummaClick(Sender: TObject);
begin
if cxCheckBoxSumma.Checked=true then
   begin
    cxCheckBoxSummaBegin.Enabled:=true;
    cxCheckBoxSummaEnd.Enabled:=true;
    If cxCheckBoxSummaBegin.Checked=true then
      begin
        cxCalcEditSummaBegin.Enabled:=true;
      end;
    If cxCheckBoxSummaEnd.Checked=true then
      begin
        cxCalcEditSummaEnd.Enabled:=true;
      end;
  end
  else
  begin
    cxCheckBoxSummaBegin.Enabled:=false;
    cxCheckBoxSummaEnd.Enabled:=false;
    cxCalcEditSummaBegin.Enabled:=false;
    cxCalcEditSummaEnd.Enabled:=false;
  end;
end;

procedure TfrmFindForm.cxCheckBoxDateClick(Sender: TObject);
begin
if cxCheckBoxDate.Checked=true then
  begin
    cxCheckBoxDateBegin.Enabled:=true;
    cxCheckBoxDateEnd.Enabled:=true;
    If cxCheckBoxDateBegin.Checked=true then
      begin
        cxDateEditBegin.Enabled:=true;
      end;
    If cxCheckBoxDateEnd.Checked=true then
      begin
        cxDateEditEnd.Enabled:=true;
      end;
  end
  else
  begin
    cxCheckBoxDateBegin.Enabled:=false;
    cxCheckBoxDateEnd.Enabled:=false;
    cxDateEditBegin.Enabled:=false;
    cxDateEditEnd.Enabled:=false;
  end;
end;

procedure TfrmFindForm.cxCheckBoxCustomerClick(Sender: TObject);
begin
if cxCheckBoxCustomer.Checked=true then
  begin
    RadioGroupCustomer.Enabled:=true;
    if RadioGroupCustomer.ItemIndex=0 then
      begin
        cxButtonEditCustomer.Enabled:=true;
      end
      else
      begin
        cxTextEditCustomer.Enabled:=true;
      end;
  end
  else
  begin
      RadioGroupCustomer.Enabled:=false;
      cxButtonEditCustomer.Enabled:=false;
      cxTextEditCustomer.Enabled:=false;
  end;
end;

procedure TfrmFindForm.cxButtonEditCustomerPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(TfrmMainFormView(Self.Owner).Database.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := SelCustomer;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
      begin
        id_cust := o['ID_CUSTOMER'];
        cxButtonEditCustomer.Text:= o['NAME_CUSTOMER'];
      end;
    i.Free;
    o.Free;
end;

procedure TfrmFindForm.ButtonFindClick(Sender: TObject);
var
  checkedBegin,checkedEnd:integer;
begin
if CheckedFilter then
begin
 closeFind:=1;
{messageBox(Handle,PChar('Ошибка при передачи пареметров поиска.Сообщите администратору.'),
     PChar('Внимание!'),MB_OK or MB_ICONWARNING);}
  if cxCheckBoxDatevip.Checked=true then
    begin
      if cxCheckBoxDatevipBegin.Checked=true then
        begin
          checkedBegin:=1;
        end
        else
        begin
          checkedBegin:=0;
        end;
      if cxCheckBoxDatevipEnd.Checked=true then
        begin
          checkedEnd:=1;
        end
        else
        begin
          checkedEnd:=0;
        end;
      param[0]:=VarArrayOf([1,checkedBegin,cxDateEditBeginVip.Date,checkedEnd,cxDateEditEndVip.Date]);
    end
    else
        begin
      if cxCheckBoxDatevipBegin.Checked=true then
        begin
          checkedBegin:=1;
        end
        else
        begin
          checkedBegin:=0;
        end;
      if cxCheckBoxDatevipEnd.Checked=true then
        begin
          checkedEnd:=1;
        end
        else
        begin
          checkedEnd:=0;
        end;
      param[0]:=VarArrayOf([0,checkedBegin,cxDateEditBeginVip.Date,checkedEnd,cxDateEditEndVip.Date]);
    end;
//по дате документа
  if cxCheckBoxDate.Checked=true then
    begin
      if cxCheckBoxDateBegin.Checked=true then
        begin
          checkedBegin:=1;
        end
        else
        begin
          checkedBegin:=0;
        end;
      if cxCheckBoxDateEnd.Checked=true then
        begin
          checkedEnd:=1;
        end
        else
        begin
          checkedEnd:=0;
        end;
      param[1]:=VarArrayOf([1,checkedBegin,cxDateEditBegin.Date,checkedEnd,cxDateEditEnd.Date]);
    end
    else
        begin
      if cxCheckBoxDatevipBegin.Checked=true then
        begin
          checkedBegin:=1;
        end
        else
        begin
          checkedBegin:=0;
        end;
      if cxCheckBoxDatevipEnd.Checked=true then
        begin
          checkedEnd:=1;
        end
        else
        begin
          checkedEnd:=0;
        end;
      param[1]:=VarArrayOf([0,checkedBegin,cxDateEditBeginVip.Date,checkedEnd,cxDateEditEndVip.Date]);
    end;
//по номеру документа
  if cxCheckBoxNumberDoc.Checked=true then
    begin
      param[2]:=VarArrayOf([1,cxMaskEditNumberDoc.Text,0,0,0]);
    end
    else
    begin
      param[2]:=VarArrayOf([0,cxMaskEditNumberDoc.Text,0,0,0]);
    end;
//по сумме документа
  if cxCheckBoxSumma.Checked=true then
    begin
      if cxCheckBoxSummaBegin.Checked=true then
        begin
          checkedBegin:=1;
        end
        else
        begin
          checkedBegin:=0;
        end;
      if cxCheckBoxSummaEnd.Checked=true then
        begin
          checkedEnd:=1;
        end
        else
        begin
          checkedEnd:=0;
        end;
      param[3]:=VarArrayOf([1,checkedBegin,cxCalcEditSummaBegin.Text,checkedEnd,cxCalcEditSummaEnd.Text]);
    end
    else
        begin
      if cxCheckBoxSummaBegin.Checked=true then
        begin
          checkedBegin:=1;
        end
        else
        begin
          checkedBegin:=0;
        end;
      if cxCheckBoxSummaEnd.Checked=true then
        begin
          checkedEnd:=1;
        end
        else
        begin
          checkedEnd:=0;
        end;
      param[3]:=VarArrayOf([0,checkedBegin,cxCalcEditSummaBegin.Text,checkedEnd,cxCalcEditSummaEnd.Text]);
    end;
//по типу документа
  if cxCheckBoxPrR.Checked=true then
    begin
      param[4]:=VarArrayOf([1,cxRadioGroupPrR.ItemIndex,0,0,0]);
    end
    else
    begin
      param[4]:=VarArrayOf([0,cxRadioGroupPrR.ItemIndex,0,0,0]);
    end;
//по нашему р\с
  if cxCheckBoxRsNative.Checked=true then
    begin
      param[5]:=VarArrayOf([1,id_acc_native,cxButtonEditRsNative.Text,0,0]);
    end
    else
    begin
      param[5]:=VarArrayOf([0,id_acc_native,cxButtonEditRsNative.Text,0,0]);
    end;
//по когтрагенту
  if cxCheckBoxCustomer.Checked=true then
    begin
      param[6]:=VarArrayOf([1,RadioGroupCustomer.ItemIndex,id_cust,cxButtonEditCustomer.Text,cxTextEditCustomer.Text]);
    end
    else
    begin
      param[6]:=VarArrayOf([0,RadioGroupCustomer.ItemIndex,id_cust,cxButtonEditCustomer.Text,cxTextEditCustomer.Text]);
    end;
//по р\с контрагента
  if cxCheckBoxRsCustom.Checked=true then
    begin
      param[7]:=VarArrayOf([1,id_acc_cust,cxButtonEditRsCustom.Text,0,0]);
    end
    else
    begin
      param[7]:=VarArrayOf([0,id_acc_cust,cxButtonEditRsCustom.Text,0,0]);
    end;

//по основанию
  if cxCheckBoxnote.Checked=true then
    begin
      param[8]:=VarArrayOf([1,cxTextEditNote.Text,0,0,0]);
    end
    else
    begin
      param[8]:=VarArrayOf([0,cxTextEditNote.Text,0,0,0]);
    end;
//по состоянию
  if cxCheckBoxWork.Checked=true then
    begin
      param[9]:=VarArrayOf([1,RadioGroupWork.ItemIndex,0,0,0]);
    end
    else
    begin
      param[9]:=VarArrayOf([0,RadioGroupWork.ItemIndex,0,0,0]);
    end;
//по удаленным
  if cxCheckBoxDelete.Checked=true then
    begin
      param[10]:=VarArrayOf([1,1,0,0,0]);
    end
    else
    begin
      param[10]:=VarArrayOf([1,0,0,0,0]);
    end;
{  if cxCalcEditSumma.Enabled=true then
    begin
      param[3][1]:=cxCalcEditSumma.Text;
    end
    else
  if param[4][0]=1 then
    begin
      cxRadioGroupPrR.Enabled:=true;
      cxRadioGroupPrR.ItemIndex:=param[4][1];
    end
    else
    begin
      cxRadioGroupPrR.Enabled:=true;
    end;
  if param[5][0]=1 then
    begin
      GroupBoxCustomer.Enabled:=true;
      cxButtonEditCustomer.Enabled:=true;
      cxButtonEditCustomer.Text:=param[5][2];
      id_cust:=param[5][1];
    end
    else
    begin
      GroupBoxCustomer.Enabled:=false;
      cxButtonEditCustomer.Enabled:=false;
    end;}
    Close;
end;
end;

procedure TfrmFindForm.cxCheckBoxDatevipBeginClick(Sender: TObject);
begin
  if cxCheckBoxDatevipBegin.Checked=true then
    begin
      cxDateEditBeginVip.Enabled:=true;
    end
    else
    begin
      cxDateEditBeginVip.Enabled:=false;
    end;
end;

procedure TfrmFindForm.cxCheckBoxDatevipEndClick(Sender: TObject);
begin
  if cxCheckBoxDatevipEnd.Checked=true then
    begin
      cxDateEditEndVip.Enabled:=true;
    end
    else
    begin
      cxDateEditEndVip.Enabled:=false;
    end;
end;

procedure TfrmFindForm.cxCheckBoxDateBeginClick(Sender: TObject);
begin
  if cxCheckBoxDateBegin.Checked=true then
    begin
      cxDateEditBegin.Enabled:=true;
    end
    else
    begin
      cxDateEditBegin.Enabled:=false;
    end;
end;

procedure TfrmFindForm.cxCheckBoxDateEndClick(Sender: TObject);
begin
  if cxCheckBoxDateEnd.Checked=true then
    begin
      cxDateEditEnd.Enabled:=true;
    end
    else
    begin
      cxDateEditEnd.Enabled:=false;
    end;
end;

procedure TfrmFindForm.cxCheckBoxSummaBeginClick(Sender: TObject);
begin
if cxCheckBoxSummaBegin.Checked=true then
  begin
    cxCalcEditSummaBegin.Enabled:=true;
  end
  else
  begin
    cxCalcEditSummaBegin.Enabled:=false;
  end;
end;

procedure TfrmFindForm.cxCheckBoxSummaEndClick(Sender: TObject);
begin
if cxCheckBoxSummaEnd.Checked=true then
  begin
    cxCalcEditSummaEnd.Enabled:=true;
  end
  else
  begin
    cxCalcEditSummaEnd.Enabled:=false;
  end;

end;

procedure TfrmFindForm.cxCheckBoxRsNativeClick(Sender: TObject);
begin
if cxCheckBoxRsNative.Checked=true then
  begin
    cxButtonEditRsNative.Enabled:=true;
  end
  else
  begin
    cxButtonEditRsNative.Enabled:=false;
  end;
end;

procedure TfrmFindForm.cxCheckBoxRsCustomClick(Sender: TObject);
begin
if cxCheckBoxRsCustom.Checked=true then
  begin
    cxButtonEditRsCustom.Enabled:=true;
  end
  else
  begin
    cxButtonEditRsCustom.Enabled:=false;
  end;
end;

procedure TfrmFindForm.cxCheckBoxnoteClick(Sender: TObject);
begin
if cxCheckBoxnote.Checked=true then
  begin
    cxTextEditNote.Enabled:=true;
  end
  else
  begin
    cxTextEditNote.Enabled:=false;
  end;
end;

procedure TfrmFindForm.RadioGroupCustomerClick(Sender: TObject);
begin
if RadioGroupCustomer.ItemIndex=0 then
  begin
    cxButtonEditCustomer.Enabled:=true;
    cxTextEditCustomer.Enabled:=false;
  end
  else
  begin
    cxTextEditCustomer.Enabled:=true;
    cxButtonEditCustomer.Enabled:=false;    
  end;
end;

procedure TfrmFindForm.cxButtonEditRsNativePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  post:Variant;
begin
post :=LoadDogManedger.WorkSpMfoRsch(self,TfrmMainFormView(Self.Owner).Database.Handle, fsNormal, 'get', -1);
  if VarArrayDimCount(post) > 0 then
  begin
    if post[0][0] > 0 then
    begin
      id_acc_native := post[0][0];
      cxButtonEditRsNative.Text :=post[0][4]+' МФО '+post[0][2]+' Р/С '+post[0][3];
    end;
  end;
end;

procedure TfrmFindForm.cxButtonEditRsCustomPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(TfrmMainFormView(Self.Owner).Database.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
      begin
        id_acc_cust := o['ID_RATE_ACCOUNT'];
        cxButtonEditRsCustom.Text := 'МФО '+o['MFO']+' банк '+o['NAME_BANK']+' Р\С '+o['RATE_ACCOUNT'];
      end;
    i.Free;
    o.Free;
end;

procedure TfrmFindForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if closeFind<>1 then
    begin
      closeFind:=0;
    end;
end;

function TfrmFindForm.DecSeparator:string;
var reg: TRegistry;
    res:string;
begin
 reg:=TRegistry.Create;
  try
   Reg.RootKey := HKEY_CURRENT_USER;
   if Reg.OpenKey('\Control Panel\International\', False) then
   begin
     Res:=Reg.ReadString('SDecimal');
     Reg.CloseKey;
   end
   else
    res:=',';
  finally
   Reg.Free;
  end;
 Result:=Res;
end;

procedure TfrmFindForm.cxCalcEditSummaBeginKeyPress(Sender: TObject;
  var Key: Char);
begin
if key in [',','.'] then
  begin
    key:=DecSeparator[1];
  end;
end;

procedure TfrmFindForm.cxCalcEditSummaEndKeyPress(Sender: TObject;
  var Key: Char);
begin
if key in [',','.'] then
  begin
    key:=DecSeparator[1];
  end;
end;

procedure TfrmFindForm.cxCheckBoxWorkClick(Sender: TObject);
begin
if cxCheckBoxWork.Checked=true then
  begin
    RadioGroupWork.Enabled:=true;
  end
  else
  begin
    RadioGroupWork.Enabled:=false;
  end;
end;

function TfrmFindForm.CheckedFilter: Boolean;
var
  TextError: String;
  CountError: Integer;
begin
 TextError  := '';
 CountError := 0;
 checkedFilter := True;
 if cxCheckBoxDatevip.Checked = True
 then begin
       if cxCheckBoxDatevipBegin.Checked = True
       then if cxDateEditBeginVip.Date > Date
            then begin
                  CheckedFilter := False;
                  TextError := 'Дата документу: дата "З" більша за сьогоднішню дату!';
                  //TextError := 'Поиск документа не может производиться, если дата документа больше текущей даты!';
                  CountError := CountError + 1;
                  cxDateEditBeginVip.SetFocus;
                  //cxDateEditBeginVip.Style.BorderColor := clRed;
                 end;
       if cxCheckBoxDatevipEnd.Checked = True
       then begin
             if cxDateEditEndVip.Date > Date
             then begin
                   CheckedFilter := False;
                   if CountError > 0
                   then TextError := TextError + #13#10;
                   TextError := TextError + 'Дата документу: дата "До" більша за сьогоднішню дату!';
                   //TextError := TextError + 'Поиск документа не может производиться, если дата документа больше текущей даты!';
                   CountError := CountError + 1;
                   cxDateEditEndVip.SetFocus;
                  end;
             if cxCheckBoxDatevipBegin.Checked = True
             then if cxDateEditBeginVip.Date > cxDateEditEndVip.Date
                  then begin
                        CheckedFilter := False;
                        if CountError > 0
                        then TextError := TextError + #13#10;
                        //TextError := TextError + 'Некорректный запрос: дата начала периода поиска больше даты окончания!';
                        TextError := TextError + 'Дата документу: Дата "З" більша за дату "До"!';
                        CountError := CountError + 1;
                        cxDateEditBeginVip.SetFocus;
                       end;
            end;
      end;
 if cxCheckBoxDate.Checked = True
 then begin
       if cxCheckBoxDateBegin.Checked = True
       then if cxDateEditBegin.Date > Date
            then begin
                  CheckedFilter := False;
                  if CountError > 0
                  then TextError := TextError + #13#10;
                  //TextError := TextError + 'Поиск документа не может производиться, если дата банковской выписки больше текущей даты!';
                  TextError := TextError + 'Дата банківської виписки: дата "З" більша за сьогоднішню дату!';
                  CountError := CountError + 1;
                  cxDateEditBegin.SetFocus;
                 end;
       if cxCheckBoxDateEnd.Checked = True
       then begin
             if cxDateEditEnd.Date > Date
             then begin
                   CheckedFilter := False;
                   if CountError > 0
                   then TextError := TextError + #13#10;
                   //TextError := TextError + 'Поиск документа не может производиться, если дата банковской выписки больше текущей даты!';
                   TextError := TextError + 'Дата банківської виписки: дата "До" більша за сьогоднішню дату!';
                   CountError := CountError + 1;
                   cxDateEditEnd.SetFocus;
                  end;
             if cxCheckBoxDateBegin.Checked = True
             then if cxDateEditBegin.Date > cxDateEditEnd.Date
                  then begin
                        CheckedFilter := False;
                        if CountError > 0
                        then TextError := TextError + #13#10;
                        TextError := TextError + 'Дата банківської виписки: Дата "З" більша за дату "До"!';
                        //TextError := TextError + 'Некорректный запрос: дата начала периода поиска больше даты окончания!';
                        CountError := CountError + 1;
                        cxDateEditBegin.SetFocus;
                       end;
            end;
      end;
 if cxCheckBoxSumma.Checked = True
 then if cxCheckBoxSummaBegin.Checked = True
      then if cxCheckBoxSummaEnd.Checked = True
           then if cxCalcEditSummaBegin.Value > cxCalcEditSummaEnd.Value
                then begin
                      CheckedFilter := False;
                      if CountError > 0
                      then TextError := TextError + #13#10;
                      //TextError := TextError + 'Некорректный запрос: минимальная сумма документа превышает максимальную!';
                      TextError := TextError + 'Сума документу: сума "З" перевищує суму "До"!';
                      CountError := CountError + 1;
                      cxCalcEditSummaBegin.SetFocus;
                     end;
 if CountError > 0
 then ShowMessage('Некоректний запит:' + #13#10+ TextError);
end;

procedure TfrmFindForm.ButtonCloseClick(Sender: TObject);
begin
  if closeFind<>1 then
    begin
      closeFind:=0;
    end;
  Close;  
end;

procedure TfrmFindForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN
   then begin
            ButtonFindClick(self);
        end;
end;

end.
