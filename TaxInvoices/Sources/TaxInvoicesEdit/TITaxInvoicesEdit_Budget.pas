unit TITaxInvoicesEdit_Budget;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCurrencyEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons, Buttons, ExtCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid,TITaxinvoicesEdit_DM, ibase,TiMessages;

type
  TTaxInvoicesEditBudgetForm = class(TForm)
    GroupBox6: TGroupBox;
    Bevel2: TBevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn_smeta: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    ToolButton_add: TSpeedButton;
    ToolButton_del: TSpeedButton;
    SpeedButton_red: TSpeedButton;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LabelNotPDV: TLabel;
    LabelPDV: TLabel;
    Label6: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label_val_deliv_20: TLabel;
    Label_Tax: TLabel;
    Label_vat_extemption: TLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure ToolButton_addClick(Sender: TObject);
    procedure SpeedButton_redClick(Sender: TObject);
    procedure ToolButton_delClick(Sender: TObject);
    procedure RxMemoryData_smetAfterScroll(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
  private
    PDb_Handle        : TISC_DB_HANDLE;
    TaxInvoicesEditDM : TTaxInvoicesEditDM;
  public
    id_vid_nakl :Integer;
    summa_val_deliv_20 :Double;
    summa_tax : Double;
    summa_val_deliv_vat_extemptions : Double;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;DM:TTaxInvoicesEditDM);reintroduce;
  end;

var
  TaxInvoicesEditBudgetForm: TTaxInvoicesEditBudgetForm;

implementation

uses LoadDogManedger;

{$R *.dfm}
constructor TTaxInvoicesEditBudgetForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;DM:TTaxInvoicesEditDM);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
  TaxInvoicesEditDM := dm;
  cxGrid1DBTableView1.DataController.DataSource := TaxInvoicesEditDM.DataSource_smet;
  TaxInvoicesEditDM.RxMemoryData_smet.AfterScroll := RxMemoryData_smetAfterScroll;
end;

procedure TTaxInvoicesEditBudgetForm.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TTaxInvoicesEditBudgetForm.ToolButton_addClick(Sender: TObject);
var
  Add            : Variant;
  cnt,i          : Integer;
  id_adding_flag : Integer;
  id_smeta       : Int64;
  id_dt_smet     : Int64;
  sum_All_Nds     : Double;
  sum_All_Not_NDS : Double;
  num_st : string;
begin
 id_adding_flag:=1;

  Add := LoadDogManedger.AddKosht(self,TaxInvoicesEditDM.DB.Handle,-1,1,0,0,0,0,0,date);
  if VarArrayDimCount(Add) > 0 then
  begin
   // i:=0;

      Cnt := VarArrayHighBound(Add, 1);
      {Проверка, есть ли однаковые разделы, кеквы, статьи }
      i:=0;
      TaxInvoicesEditDM.RxMemoryData_smet.First;
      while (not TaxInvoicesEditDM.RxMemoryData_smet.Eof) do
       begin
        if ((TaxInvoicesEditDM.RxMemoryData_smet['id_smet']=Add[i][7]) And
            (TaxInvoicesEditDM.RxMemoryData_smet['id_razd']=Add[i][8]) And
            (TaxInvoicesEditDM.RxMemoryData_smet['id_stat']=Add[i][9]) And
            (TaxInvoicesEditDM.RxMemoryData_smet['id_kekv']=Add[i][10])) then
         begin
          //MessageBox(0,'Found','Update',MB_OK);
          TaxInvoicesEditDM.RxMemoryData_smet.Open;
          TaxInvoicesEditDM.RxMemoryData_smet.Edit;
          TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3]+TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value;

          TaxInvoicesEditDM.RxMemoryData_smet.Post;
          Break;
         end;
         TaxInvoicesEditDM.RxMemoryData_smet.next;
       end;

      //DoCheckBgt(Add[i][7],rate_acc_un);

      if id_adding_flag = 1 then
      begin
      for i := 0 to Cnt do
       begin
        //id_smeta := Add[i][7];
        //id_dt_smet := TaxInvoicesDM.RxMemoryData_smet.FieldByName('id').AsVariant;
        TaxInvoicesEditDM.RxMemoryData_smet.Locate('id', id_dt_smet, []);
        TaxInvoicesEditDM.RxMemoryData_smet.Open;
        TaxInvoicesEditDM.RxMemoryData_smet.Insert;
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_smet').Value := Add[i][7];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_razd').Value := Add[i][8];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_stat').Value := Add[i][9];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_razd').Value := Add[i][5];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value := Add[i][6];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_kekv').Value := Add[i][10];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_kekv').Value := Add[i][11];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id').Value := 0;
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('flag_del').Value := 0;
        TaxInvoicesEditDM.RxMemoryData_smet.Post;
       end;
      end;
      TaxInvoicesEditDM.RxMemoryData_smet.First;
      sum_All_Nds     := 0;
      sum_All_Not_NDS := 0;
      for i := 0 to TaxInvoicesEditDM.RxMemoryData_smet.RecordCount-1 do
      begin
        TaxInvoicesEditDM.RxMemoryData_smet.Open;
        if TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
          sum_All_Nds     := sum_All_Nds + TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value
        else
          sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
        TaxInvoicesEditDM.RxMemoryData_smet.Next;
      end;
      LabelPDV.Caption := FloatToStr(sum_All_Nds);
      LabelNotPDV.Caption := FloatToStr(sum_All_Not_NDS);
  end;
end;

procedure TTaxInvoicesEditBudgetForm.SpeedButton_redClick(Sender: TObject);
var
  Add: Variant;
  cnt,i: Integer;
  id_adding_flag:Integer;
  id_smeta : Int64;
  id_dt_smet : Int64;
  sum_All_Nds     : Double;
  sum_All_Not_NDS : Double;
begin
  if TaxInvoicesEditDM.RxMemoryData_smet.RecordCount = 0 then Exit;

   Add := LoadDogManedger.AddKosht(self,TaxInvoicesEditDM.DB.Handle,-1,2,
                                   TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_smet').AsInteger,
                                   TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_razd').AsInteger,
                                   TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_stat').AsInteger,
                                   TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_kekv').AsInteger,
                                   TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency,date);
      if VarArrayDimCount(Add) > 0 then
      begin
        i:=0;
        TaxInvoicesEditDM.RxMemoryData_smet.Open;
        TaxInvoicesEditDM.RxMemoryData_smet.edit;
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_smet').Value   := Add[i][7];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_razd').Value   := Add[i][8];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_stat').Value   := Add[i][9];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := Add[i][3];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_razd').Value    := Add[i][5];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value    := Add[i][6];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := Add[i][10];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := Add[i][11];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id').Value := 0;
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('flag_del').Value := 0;
        TaxInvoicesEditDM.RxMemoryData_smet.Post;

        TaxInvoicesEditDM.RxMemoryData_smet.First;
        sum_All_Nds     := 0;
        sum_All_Not_NDS := 0;
        for i := 0 to TaxInvoicesEditDM.RxMemoryData_smet.RecordCount-1 do
        begin
          if TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
            sum_All_Nds     := sum_All_Nds + TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value
          else
            sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
          TaxInvoicesEditDM.RxMemoryData_smet.Next;
        end;
        LabelPDV.Caption := FloatToStr(sum_All_Nds);
        LabelNotPDV.Caption := FloatToStr(sum_All_Not_NDS);
      end;

end;

procedure TTaxInvoicesEditBudgetForm.ToolButton_delClick(Sender: TObject);
var
  summa_old_Not_NDS : Double;
  summa_old_NDS     : Double;
  summa_NDS         : Double;
  summa_Not_NDS     : Double;
begin
  if TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
    begin
      summa_NDS := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency;
    end
  else
      summa_Not_NDS := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency;
  if (TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300') then
    begin
      summa_old_NDS := StrToFloat(LabelPDV.caption);
      LabelPDV.caption := FloatToStr(summa_old_NDS - summa_NDS);
    end
  else
    begin
      summa_old_Not_NDS := StrToFloat(LabelNotPDV.caption);
      LabelNotPDV.caption := FloatToStr(summa_old_Not_NDS - summa_Not_NDS);
    end;

  if TaxInvoicesEditDM.RxMemoryData_smet.RecordCount = 0 then Exit;

  TaxInvoicesEditDM.RxMemoryData_smet.Delete;
end;

procedure TTaxInvoicesEditBudgetForm.RxMemoryData_smetAfterScroll(
  DataSet: TDataSet);
begin
  Label21.Caption := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label22.Caption := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label23.Caption := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label26.Caption := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label21.Hint := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label21.ShowHint := true;
  Label22.Hint := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label22.ShowHint := true;
  Label23.Hint := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label23.ShowHint := true;
  Label26.Hint := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label26.ShowHint := true;
end;

procedure TTaxInvoicesEditBudgetForm.cxButton1Click(Sender: TObject);
var
  summa_NDS : Extended;
  summa_not_NDS : Extended;
  i : Integer;
begin
    TaxInvoicesEditDM.RxMemoryData_smet.First;
    for i:= 0 to TaxInvoicesEditDM.RxMemoryData_smet.RecordCount-1 do
    begin
      if TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300'      then
        begin
          summa_NDS :=  summa_NDS + TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
        end
      else
        summa_not_NDS := summa_not_NDS + TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
      TaxInvoicesEditDM.RxMemoryData_smet.Next;
    end;

    // если сумма НДС не нулевая

    if summa_NDS <> 0 then
    begin
        //ShowMessage(FloatToStrF(summa_NDS, ffFixed,10,2));
        if Label_Tax.Caption <> FloatToStrF(summa_NDS, ffFixed,10,2) then
        begin
         TiShowMessage('Увага!', 'Сума ПДВ (бюджети) = ' +FloatToStrF(summa_NDS, ffFixed,10,2) +'. Введена сума ПДВ ='+FloatToStrF(StrToFloat(Label_Tax.Caption), ffFixed,10,2)+'. Суми повинні співпадати!' , mtWarning, [mbOK]);
         Exit;
        end;

       // if SummaPDV20CurrencyEdit.Value <> 0 then

        if Label_val_deliv_20.Caption <> FloatToStrF(summa_not_NDS, ffFixed,10,2) then
        begin
         TiShowMessage('Увага!', '20% ,обсяг без ПДВ(бюджети) = ' + FloattostrF(summa_not_NDS,ffFixed,10,2)+'. Введена сума 20%, обсяг без ПДВ ='+Label_val_deliv_20.Caption+'. Суми повинні співпадати!' , mtWarning, [mbOK]);
         Exit;
        end

        //else

       { if SummaExemptCurrencyEdit.Value <> summa_not_NDS then
        begin
         TiShowMessage('Увага!', 'Звільнені від оподаткув.(бюджети) = ' + Floattostr(summa_not_NDS)+'. Введена сума Звільнені від оподаткув. ='+FloatToStr(SummaTaxable20CurrencyEdit.EditValue)+'. Суми повинні співпадати!' , mtWarning, [mbOK]);
         SummaTaxable20CurrencyEdit.SetFocus;
         Exit;
        end; }
    end;
      //если сумма НДС - ноль
      if summa_NDS = 0 then
      begin
        if StrToFloat(Label_Tax.Caption) <> 0 then
        begin
         TiShowMessage('Увага!', 'Сума ПДВ (бюджети) = 0. Введена сума ПДВ = '+ Label_Tax.Caption+' . Суми повинні співпадати!', mtWarning, [mbOK]);
         Exit;
        end;

        if ((StrToFloat(Label_val_deliv_20.Caption) <> 0) and (StrToFloat(Label_Tax.Caption)= 0) ) then
        begin
         TiShowMessage('Увага!', 'Введена сума ПДВ = 0. Сума 20% обсяг без ПДВ не повинна заповнюватися!', mtWarning, [mbOK]);
         Exit;
        end;

        if Label_vat_extemption.Caption <> FloatToStrF(summa_not_NDS, ffFixed,10,2) then
        begin
         TiShowMessage('Увага!', 'Звільнені від оподаткув.(бюджети) = ' + FloatToStrF(summa_not_NDS, ffFixed,10,2)+'. Введена сума Звільнені від оподаткув. ='+Label_vat_extemption.Caption+'. Суми повинні співпадати!' , mtWarning, [mbOK]);
         Exit;
        end;
      end;

      ModalResult := mrOk;
end;

end.
