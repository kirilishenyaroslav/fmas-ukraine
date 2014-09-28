unit CatTarifGridAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxCurrencyEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxMaskEdit, cxDropDownEdit, cxCalendar, uFControl, uLabeledFControl,
  uCharControl, uFloatControl, cxCheckBox, BaseTypes, uIntControl, DB,
  FIBDataSet, pFIBDataSet, Math;

type
  TfrmCatTarifGridAdd = class(TForm)
    CatNote: TcxTextEdit;
    lblNote: TcxLabel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    ActList: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
    lblKoeff: TcxLabel;
    lblCategory: TcxLabel;
    CatKoeff: TcxCurrencyEdit;
    CategoryEdit: TcxTextEdit;
    DataSet: TpFIBDataSet;
    MinValueEdit: TcxCurrencyEdit;
    SumEdit: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure ActOkExecute(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
    procedure CategoryEditKeyPress(Sender: TObject; var Key: Char);
    procedure CatKoeffPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FirstRate:Double;
    ActDate:TDate;
    IdTarifGrid:Integer;
    IdCategoryGrid:Variant;
    ModeEdit:String;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; EditMode:Boolean;
                       Id_Tarif:Variant; ActualDate:TDate;
                       RateValue, SumStav:Double;
                       IdCategory:Variant);
    function GetMinCategory(DateValue:TDate):Double;
    function IsExistsCategory(NumCat:Integer):Boolean;
  end;

var
  frmCatTarifGridAdd: TfrmCatTarifGridAdd;

implementation

uses TarifGridMain;

{$R *.dfm}

constructor TfrmCatTarifGridAdd.Create(AOwner:TComponent; EditMode:Boolean;
                                       Id_Tarif:Variant; ActualDate:TDate;
                                       RateValue, SumStav:Double;
                                       IdCategory:Variant);
begin
   inherited Create(AOwner);
   IdCategoryGrid:=IdCategory;
   ModeEdit:='T';
   if EditMode=False then
   begin
      try
        DataSet.Close;
        DataSet.SQLs.SelectSQL.Clear;
        DataSet.SQLs.SelectSQL.Text:='select max(num_category) '+
                                     'from up_category_tarif_grid '+
                                     'where id_tarif_grid=:id_tarif_grid';
        DataSet.ParamByName('id_tarif_grid').Value:=Id_Tarif;
        DataSet.Open;
        CategoryEdit.Text:=IntToStr(DataSet['max']+1);
        ModeEdit:='F';
      except on E:Exception
             do begin
                   CategoryEdit.Text:='1';
             end;
      end;
      CatKoeff.Value:=1;
   end;
   IdTarifGrid:=Id_Tarif;
   MinValueEdit.Value:=SumStav;
   FirstRate:=RateValue;
   ActDate:=ActualDate;
end;

function TfrmCatTarifGridAdd.IsExistsCategory(NumCat:Integer):Boolean;
begin
   try
     Result:=False;
     DataSet.Close;
     DataSet.SQLs.SelectSQL.Clear;
     DataSet.SQLs.SelectSQL.Text:='select can_add '+
                                  'from up_check_can_add_category(:id_tarif_grid, :num_category, :edit_mode, :id_category_grid)';
     DataSet.ParamByName('id_tarif_grid').AsInteger:=IdTarifGrid;
     DataSet.ParamByName('num_category').AsInteger:=NumCat;
     DataSet.ParamByName('edit_mode').AsString:=ModeEdit;
     DataSet.ParamByName('id_category_grid').Value:=IdCategoryGrid;
     DataSet.Open;
     DataSet.FetchAll;
     if DataSet['can_add']='T' then Result:=True;
   except on E:Exception
          do begin
               Result:=False;
          end;
   end;
end;

function TfrmCatTarifGridAdd.GetMinCategory(DateValue:TDate):Double;
begin
   try
     DataSet.Close;
     DataSet.SQLs.SelectSQL.Clear;
     DataSet.SQLs.SelectSQL.Text:='select min_value '+
                                  'from get_min_category(:act_date)';
     DataSet.ParamByName('act_date').Value:=DateValue;
     DataSet.Open;
     Result:=DataSet['min_value'];
   except on E:Exception
          do begin
                Result:=0;
          end;
   end;
end;

procedure TfrmCatTarifGridAdd.ActOkExecute(Sender: TObject);
begin
    If CategoryEdit.Text='' then
    begin
       agMessageDlg('Увага', 'Треба ввести розряд!', mtInformation, [mbOK]);
       Exit;
    end;

    If (VarIsNull(CatKoeff.Value)) then
    begin
       agMessageDlg('Увага', 'Треба ввести коефіцієнт!', mtInformation, [mbOK]);
       Exit;
    end;
    if IsExistsCategory(StrToInt(CategoryEdit.Text))=False then
    begin
       agMessageDlg('Увага', 'Такий розряд вже існує!', mtInformation, [mbOK]);
       Exit;
    end;
    ModalResult:=mrOk;
end;

procedure TfrmCatTarifGridAdd.ActCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmCatTarifGridAdd.CategoryEditKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key in ['0'..'9']) or (key=#8) then CategoryEdit.Properties.ReadOnly:=False
   else CategoryEdit.Properties.ReadOnly:=True;
end;

procedure TfrmCatTarifGridAdd.CatKoeffPropertiesChange(Sender: TObject);
var CurValue, MinValue:Double;
begin
   try
     CurValue:=StrToFloat(CatKoeff.Text);
   except
     CurValue:=0;
   end;
   MinValue:=GetMinCategory(ActDate);
   SumEdit.Value:=SimpleRoundTo(CurValue*MinValueEdit.Value, -2);
end;

procedure TfrmCatTarifGridAdd.FormShow(Sender: TObject);
begin
   if CategoryEdit.Text='1' then
   begin
      CatKoeff.Text:='1';
      CatKoeff.Enabled:=False;
      CategoryEdit.Enabled:=False;
   end;
    if CategoryEdit.Enabled=False Then CatNote.SetFocus;
end;

end.
