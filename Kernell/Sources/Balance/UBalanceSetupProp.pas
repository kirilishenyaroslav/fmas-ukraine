unit UBalanceSetupProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxRadioGroup, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxLookAndFeelPainters, cxButtons, ActnList,
  cxCheckBox, cxMaskEdit, DB, FIBDataSet, pFIBDataSet, cxDBEdit, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, FIBQuery, pFIBQuery;

type
  TfrmBalanceSetupProp = class(TForm)
    LBalanceSetupName: TcxLabel;
    LLineCode: TcxLabel;
    TextEdit_BalanceSetupName: TcxTextEdit;
    LFormula: TcxLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Button_OK: TcxButton;
    Button_Cancel: TcxButton;
    CheckBox_root: TcxCheckBox;
    Button_plusSch: TcxButton;
    Button_minusSch: TcxButton;
    DataSource: TDataSource;
    pFIBDataSet: TpFIBDataSet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    pFIBDataSet_Sch: TpFIBDataSet;
    DataSource_Sch: TDataSource;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    Button_DelSch: TcxButton;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxStyle1: TcxStyle;
    TextEdit_Formula: TcxMaskEdit;
    pFIBQuery: TpFIBQuery;
    MaskEdit_LineCode: TcxMaskEdit;
    ActionList1: TActionList;
    act_OK: TAction;
    act_Cancel: TAction;
    act_delSch: TAction;
    act_PlusSch: TAction;
    act_MinusSch: TAction;
    LOrderCode: TcxLabel;
    MaskEdit_OrderCode: TcxMaskEdit;
    RadioGroup_FormulaType: TcxRadioGroup;
    CheckBox_no_summ: TcxCheckBox;
    procedure act_OKExecute(Sender: TObject);
    procedure act_plusSchExecute(Sender: TObject);
    procedure act_delSchExecute(Sender: TObject);
    procedure act_minusSchExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure act_CancelExecute(Sender: TObject);
    procedure CheckBox_rootPropertiesChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup_FormulaTypePropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    ID_BALANCE_SETUP, ID_BALANCE: int64;
    n1,n2:string;
    FormulaBySch, FormulaByCode: string;
    constructor Create(AOwner: TComponent; ID_BALANCE_SETUP, ID_BALANCE: int64);overload;
  end;


implementation

uses Math, UBalance, UDbKrSch, GlobalSPR, getBalance, Resources_unitb;

{$R *.dfm}

constructor TfrmBalanceSetupProp.Create(AOwner: TComponent; ID_BALANCE_SETUP, ID_BALANCE: int64);
begin
    Inherited Create(AOwner);
    self.ID_BALANCE_SETUP:=ID_BALANCE_SETUP;
    self.ID_BALANCE:=ID_BALANCE;
    FormulaBySch :='';
    FormulaByCode:='';

    Button_OK.Caption                     := getBalance.btn_Ok;
    Button_Cancel.Caption                 := getBalance.btn_Cancel;
    LBalanceSetupName.Caption             := getBalance.column_Name;
    LLineCode.Caption                     := getBalance.column_Code;
    LOrderCode.Caption                    := getBalance.column_Order;
    CheckBox_root.Properties.Caption      := getBalance.checkbox_root;
    CheckBox_no_summ.Properties.Caption   := getBalance.checkbox_nosumm;
    
    RadioGroup_FormulaType.ItemIndex := -1;
    RadioGroup_FormulaType.Properties.Items[0].Caption :=getBalance.rdbtn_frmlbysch;
    RadioGroup_FormulaType.Properties.Items[1].Caption :=getBalance.rdbtn_frmlbycode;
    RadioGroup_FormulaType.Properties.Items[2].Caption :=getBalance.rdbtn_frmlbysum;
end;

procedure TfrmBalanceSetupProp.FormShow(Sender: TObject);
var
  flag_sum: variant;
begin
    pFIBDataSet.Close;
    pFIBDataSet.SelectSQL.Text:='select NO_SUMM from PUB_SP_BALANCE_SETUP WHERE ID_BALANCE_SETUP=:ID_BALANCE_SETUP';
    pFIBDataSet.ParamByName('ID_BALANCE_SETUP').AsInt64:=ID_BALANCE_SETUP;
    pFIBDataSet.Open;
    flag_sum:=pFIBDataSet.FBN('NO_SUMM').Value;
    if (flag_sum=null) or (flag_sum=0) then
      CheckBox_no_summ.Checked:=false
    else
      CheckBox_no_summ.Checked:=true;
    pFIBDataSet.Close;
    pFIBDataSet.SelectSQL.Text:='select FORMULA from PUB_SP_BALANCE_SETUP_CHNG_FRML(:ID_BALANCE_SETUP,NULL,NULL,NULL)';
    pFIBDataSet.ParamByName('ID_BALANCE_SETUP').AsInt64:=ID_BALANCE_SETUP;
    pFIBDataSet.Open;
    TextEdit_Formula.Text:=pFIBDataSet.FBN('FORMULA').AsString;
    pFIBDataSet_Sch.Close;
    pFIBDataSet_Sch.SelectSQL.Text:=
          'select bsf.ID_FORMULA, (case when bsf.sch_sign=-1 then ''-'' when bsf.sch_sign=1 then ''+'' end) as sch_sign,'+
          ' ms.sch_number||'' (''||bsf.DB_OR_KR||'')'' as sch_number, ms.sch_title, bsf.DB_OR_KR '+
          ' from PUB_SP_BALANCE_SETUP_FORMULA bsf join PUB_SP_MAIN_SCH ms on bsf.id_sch=ms.id_sch '+
          ' where ''now'' between ms.date_beg and ms.date_end '+
          ' and bsf.ID_BALANCE_SETUP='+inttostr(ID_BALANCE_SETUP);
    pFIBDataSet_Sch.Open;
end;

procedure TfrmBalanceSetupProp.act_OKExecute(Sender: TObject);
var
  f1: boolean;
  i: Integer;
begin
    f1:=false;
    n1:='';
    n2:='';
    if Length(TextEdit_BalanceSetupName.Text)=0
    then begin
        showmessage('Заповніть дані. Введіть назву.');
        TextEdit_BalanceSetupName.SetFocus;
        exit;
    end;

    if RadioGroup_FormulaType.ItemIndex = 1
    then begin
        pFIBQuery.Close;
        pFIBQuery.Transaction.StartTransaction;
        pFIBQuery.SQL.Text:='delete from PUB_SP_BALANCE_SETUP_FORMULA bsf where bsf.ID_BALANCE_SETUP='+inttostr(ID_BALANCE_SETUP);
        pFIBQuery.Prepare;
        pFIBQuery.ExecQuery;
        pFIBQuery.Transaction.Commit;
        if (TextEdit_Formula.Text<>'')
        then begin
            for i:=1 to Length(TextEdit_Formula.Text) do
            begin
                if (TextEdit_Formula.Text[i]='+') or (TextEdit_Formula.Text[i]='-') then f1:=true
                else  if f1
                      then n2:=n2+TextEdit_Formula.Text[i]
                      else n1:=n1+TextEdit_Formula.Text[i];
            end;
            if (Length(n1)=0) or (Length(n2)=0) or (n1=MaskEdit_LineCode.Text) or (n2=MaskEdit_LineCode.Text) or (n1=n2)
            then begin
                showmessage('Введіть коректні дані.');
                TextEdit_Formula.SetFocus;
                exit;
            end;
            pFIBDataSet.Close;
            pFIBDataSet.SelectSQL.Text:='select * from PUB_SP_BALANCE_SETUP bs where bs.LINE_CODE='+n1+' and bs.ID_BALANCE='+inttostr(ID_BALANCE);
            pFIBDataSet.Open;
            if pFIBDataSet.RecordCount=0
            then begin
                showmessage('Не існує балансової строки з кодом '+n1);
                TextEdit_Formula.SetFocus;
                exit;
            end;
            if pFIBDataSet.FBN('FORMULA_TYPE').AsString='1'
            then begin
                showmessage('Не можна ссилатися на балансову строку '+n1+#13+'Вона має тип "сума балансових рахунків".');
                TextEdit_Formula.SetFocus;
                exit;
            end;
            if pFIBDataSet.RecordCount>1
            then begin
                showmessage('Існує кілька записів з кодом '+n1);
                exit;
            end;
            n1:=pFIBDataSet.FBN('ID_BALANCE_SETUP').AsString;
            pFIBDataSet.Close;
            pFIBDataSet.SelectSQL.Text:='select * from PUB_SP_BALANCE_SETUP bs where bs.LINE_CODE='+n2+' and bs.ID_BALANCE='+inttostr(ID_BALANCE);
            pFIBDataSet.Open;
            if pFIBDataSet.RecordCount=0
            then begin
                showmessage('Не існує балансової строки з кодом '+n2);
                TextEdit_Formula.SetFocus;
                exit;
            end;
            if pFIBDataSet.FBN('FORMULA_TYPE').AsString='1'
            then begin
                showmessage('Не можна ссилатися на балансову строку '+n2);
                TextEdit_Formula.SetFocus;
                exit;
            end;
            if pFIBDataSet.RecordCount>1
            then begin
                showmessage('Існує кілька записів з кодом '+n2);
                exit;
            end;
            n2:=pFIBDataSet.FBN('ID_BALANCE_SETUP').AsString;
        end;
    end;
    
    if MaskEdit_LineCode.Text<>''
    then begin        
        pFIBDataSet.Close;
        pFIBDataSet.SelectSQL.Text:='select * from PUB_SP_BALANCE_SETUP bs where bs.LINE_CODE='+MaskEdit_LineCode.Text+' and bs.ID_BALANCE='+inttostr(ID_BALANCE)+' and bs.ID_BALANCE_SETUP<>'+inttostr(ID_BALANCE_SETUP);
        pFIBDataSet.Open;
        if pFIBDataSet.RecordCount>0
        then begin
            ShowMessage('Код '+MaskEdit_LineCode.Text+' вже існує. Введіть інший.');
            MaskEdit_LineCode.SetFocus;
            exit;
        end;
    end;
    ModalResult:=mrOk;
end;

procedure TfrmBalanceSetupProp.FormClose(Sender: TObject; var Action: TCloseAction);
begin                          
    if ModalResult<>mrOk then begin
        pFIBQuery.Close;
        pFIBQuery.Transaction.StartTransaction;
        pFIBQuery.SQL.Text:='select bs.FORMULA_TYPE from PUB_SP_BALANCE_SETUP bs where bs.ID_BALANCE_SETUP=:ID_BALANCE_SETUP';
        pFIBQuery.ParamByName('ID_BALANCE_SETUP').AsInt64:=ID_BALANCE_SETUP;
        pFIBQuery.ExecQuery;
        if pFIBQuery.FieldByName('FORMULA_TYPE').AsString='1'
        then begin
            try
                pFIBQuery.Transaction.Commit;
                pFIBQuery.Close;
                pFIBQuery.Transaction.StartTransaction;
                pFIBQuery.SQL.Text:='DELETE FROM PUB_SP_BALANCE_SETUP_FORMULA bsf WHERE bsf.id_balance_setup=:id_balance_setup';
                pFIBQuery.ParamByName('ID_BALANCE_SETUP').AsInt64:=ID_BALANCE_SETUP;
                pFIBQuery.ExecQuery;
                pFIBQuery.Transaction.Commit;
                Except on E:Exception
                do  begin
                        pFIBQuery.Transaction.Rollback;
                        ShowMessage(E.Message);
                    end;
                end;
        end else pFIBQuery.Transaction.Commit;
        ModalResult:=mrCancel;
    end;
end;

procedure TfrmBalanceSetupProp.act_delSchExecute(Sender: TObject);
begin
    if pFIBDataSet_Sch.IsEmpty then exit;
    if MessageBox(self.Handle,'?','Warning',MB_YESNO or MB_ICONWARNING)=mryes then
    begin
        try
        pFIBQuery.Close;
        pFIBQuery.Transaction.StartTransaction;
        pFIBQuery.ExecProcedure('PUB_SP_BALANCE_SETUP_FRML_DEL',[pFIBDataSet_Sch.FBN('ID_FORMULA').AsInteger]);
        pFIBQuery.Transaction.Commit;
        except on E:Exception
        do  begin pFIBQuery.Transaction.Rollback;
                  ShowMessage(E.Message);
            end;
        end;
    end;
    pFIBDataSet_Sch.CloseOpen(true);
end;

procedure TfrmBalanceSetupProp.act_plusSchExecute(Sender: TObject);
var
  RES: Variant;
  i: Integer;
  d: int64;
  T: TfrmDbKr;
begin
    if not pFIBDataSet_Sch.IsEmpty
    then d:=pFIBDataSet_Sch.FBN('ID_FORMULA').AsInteger;

    RES:=GlobalSpr.GetSch( self, TfrmBalance(self.Owner).DB.Handle, fsNormal, DATE, DEFAULT_ROOT_ID,0,0);
    T:=TfrmDbKr.Create(self);
    if TfrmBalance(self.Owner).PageControl.ActivePageIndex=0
    then T.RadioButton_Db.Checked:=true
    else T.RadioButton_Kr.Checked:=true;
    if (VarArrayDimCount(RES)>0) and (T.ShowModal=mrOk) then
    begin
        for i:=0 to VarArrayHighBound(RES,1) do
        begin
            try
            pFIBQuery.Close;
            pFIBQuery.Transaction.StartTransaction;
            pFIBQuery.SQL.Text:='execute procedure PUB_SP_BALANCE_SETUP_CHNG_FRML(:ID_BALANCE_SETUP,:ID_SCH,:SCH_SIGN,:DB_KR)';
            pFIBQuery.ParamByName('ID_BALANCE_SETUP').AsInt64:=ID_BALANCE_SETUP;
            pFIBQuery.ParamByName('ID_SCH').AsInt64:=RES[i][0];
            pFIBQuery.ParamByName('SCH_SIGN').AsInteger:=1;
            if T.RadioButton_Db.Checked then pFIBQuery.ParamByName('DB_KR').AsString:='дб';
            if T.RadioButton_Kr.Checked then pFIBQuery.ParamByName('DB_KR').AsString:='кр';
            pFIBQuery.Prepare;
            pFIBQuery.ExecProc;

            d:=pFIBQuery.FldByName['OUT_FORMULA'].AsInteger;
            TextEdit_Formula.Text:=pFIBQuery.FldByName['FORMULA'].AsString;
            pFIBQuery.Transaction.Commit;
            except on E:Exception
            do  begin pFIBQuery.Transaction.Rollback;
                      ShowMessage(E.Message);
                end;
            end;
        end;
        pFIBDataSet_Sch.CloseOpen(true);
        if not pFIBDataSet_Sch.IsEmpty then pFIBDataSet_Sch.Locate('ID_FORMULA',d,[]);
    end;
end;

procedure TfrmBalanceSetupProp.act_minusSchExecute(Sender: TObject);
var
  RES: Variant;
  i: Integer;
  d: int64;
  T: TfrmDbKr;  
begin
    if not pFIBDataSet_Sch.IsEmpty
    then d:=pFIBDataSet_Sch.FBN('ID_FORMULA').AsInteger;
    
    RES:=GlobalSpr.GetSch( self, TfrmBalance(self.Owner).DB.Handle, fsNormal, DATE, DEFAULT_ROOT_ID,0,0);
    T:=TfrmDbKr.Create(self);
    if TfrmBalance(self.Owner).PageControl.ActivePageIndex=0
    then T.RadioButton_Db.Checked:=true
    else T.RadioButton_Kr.Checked:=true;
    if (VarArrayDimCount(RES)>0) and (T.ShowModal=mrOk) then
    begin
        for i:=0 to VarArrayHighBound(RES,1) do
        begin
            try
            pFIBQuery.Close;
            pFIBQuery.Transaction.StartTransaction;
            pFIBQuery.SQL.Text:='execute procedure PUB_SP_BALANCE_SETUP_CHNG_FRML(:ID_BALANCE_SETUP,:ID_SCH,:SCH_SIGN,:DB_KR)';
            pFIBQuery.ParamByName('ID_BALANCE_SETUP').AsInt64:=ID_BALANCE_SETUP;
            pFIBQuery.ParamByName('ID_SCH').AsInt64:=RES[i][0];
            pFIBQuery.ParamByName('SCH_SIGN').AsInteger:=-1;
            if T.RadioButton_Db.Checked then pFIBQuery.ParamByName('DB_KR').AsString:='дб';
            if T.RadioButton_Kr.Checked then pFIBQuery.ParamByName('DB_KR').AsString:='кр';
            pFIBQuery.Prepare;
            pFIBQuery.ExecProc;

            d:=pFIBQuery.FldByName['OUT_FORMULA'].AsInteger;
            TextEdit_Formula.Text:=pFIBQuery.FldByName['FORMULA'].AsString;
            pFIBQuery.Transaction.Commit;
            except on E:Exception
            do  begin pFIBQuery.Transaction.Rollback;
                      ShowMessage(E.Message);
                end;
            end;
        end;
        pFIBDataSet_Sch.CloseOpen(True);
        if not pFIBDataSet_Sch.IsEmpty then pFIBDataSet_Sch.Locate('ID_FORMULA',d,[]);
    end;
end;

procedure TfrmBalanceSetupProp.act_CancelExecute(Sender: TObject);
begin
    close;
end;

procedure TfrmBalanceSetupProp.CheckBox_rootPropertiesChange(Sender: TObject);
begin
    RadioGroup_FormulaType.Enabled      :=not CheckBox_root.Checked;
end;

procedure TfrmBalanceSetupProp.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if ((key=ord('+')) and (ssCtrl in Shift)) then showmessage('+');
    if ((key=ord('-')) and (ssCtrl in Shift)) then showmessage('-');
end;

procedure TfrmBalanceSetupProp.RadioGroup_FormulaTypePropertiesChange(
  Sender: TObject);
begin
    if RadioGroup_FormulaType.ItemIndex = 1
    then begin
        Button_plusSch.Enabled:=false;
        Button_minusSch.Enabled:=false;
        Button_DelSch.Enabled:=false;
        TextEdit_Formula.Style.Color:=cxStyle2.Color;
        TextEdit_Formula.Properties.ReadOnly:=false;
        TextEdit_Formula.TabStop:=true;
        FormulaBySch:=TextEdit_Formula.Text;
        TextEdit_Formula.Properties.EditMask:='\d\d?\d?\d?-\d\d?\d?\d?';
        TextEdit_Formula.Text:=FormulaByCode;
        cxGrid1.Enabled:=false;
        cxGrid1DBTableView1.Styles.Content:=cxStyle1;
        cxGrid1DBTableView1.Styles.Background:=cxStyle1;
    end;

    if RadioGroup_FormulaType.ItemIndex = 0
    then begin
        Button_plusSch.Enabled:=true;
        Button_minusSch.Enabled:=true;
        Button_DelSch.Enabled:=true;
        TextEdit_Formula.Style.Color:=cxStyle1.Color;
        TextEdit_Formula.Properties.ReadOnly:=true;
        TextEdit_Formula.TabStop:=false;
        FormulaByCode:=TextEdit_Formula.Text;
        TextEdit_Formula.Properties.EditMask:='';
        TextEdit_Formula.Text:=FormulaBySch;
        cxGrid1.Enabled:=true;
        cxGrid1DBTableView1.Styles.Content:=cxStyle2;
        cxGrid1DBTableView1.Styles.Background:=cxStyle2;
    end;

    if RadioGroup_FormulaType.ItemIndex = 2
    then begin
        Button_plusSch.Enabled:=false;
        Button_minusSch.Enabled:=false;
        Button_DelSch.Enabled:=false;
        TextEdit_Formula.Style.Color:=cxStyle2.Color;
        TextEdit_Formula.Properties.ReadOnly:=true;
        TextEdit_Formula.TabStop:=true;
        FormulaBySch:=TextEdit_Formula.Text;
        TextEdit_Formula.Properties.EditMask:='\d\d?\d?\d?-\d\d?\d?\d?';
        TextEdit_Formula.Text:=FormulaByCode;
        cxGrid1.Enabled:=false;
        cxGrid1DBTableView1.Styles.Content:=cxStyle1;
        cxGrid1DBTableView1.Styles.Background:=cxStyle1;
    end;

end;

end.
