unit uSmetaSplit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
  uShtatDocData, uFormControl;

type
  TfmSmetaSplit = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label1: TLabel;
    Category: TqFSpravControl;
    Smeta: TqFSpravControl;
    FormControl: TqFFormControl;
    Smeta2: TqFSpravControl;
    IdRaise: TqFSpravControl;
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CategoryOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkButtonClick(Sender: TObject);
    procedure IdRaiseOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    { Private declarations }
  public
    Data: TdmShtatDoc;
  end;

var
  fmSmetaSplit: TfmSmetaSplit;

implementation

{$R *.dfm}

uses GlobalSPR, qFTools, uSelectForm, pFIBQuery, NagScreenUnit, uCommonSp;

procedure TfmSmetaSplit.SmetaOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    id:variant;
begin
    id := GlobalSPR.GetSmets(Owner, Data.DB.Handle, Date, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;
end;

procedure TfmSmetaSplit.CategoryOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if qSelect(Data.CategoriesSelect) then
    begin
        Value := Data.CategoriesSelect['Id_Category'];
        DisplayText := Data.CategoriesSelect['Name_Category'];
    end;
end;

procedure TfmSmetaSplit.OkButtonClick(Sender: TObject);
var
    NagScreen: TNagScreen;
begin
    if not qFCheckAll(Self) then Exit;

    if not qFConfirm('Ви справді бажаєте розбити посади даної категорії за джерелами фінансування?')
        then
    begin
        ModalResult := mrCancel;
        Exit;
    end;


    with Data.SplitSmeta do
    begin
        ParamByName('ID_SR').AsInteger := Data.ShtatDocSelect['Id_SR'];
        ParamByName('ID_Category').AsInteger := Category.Value;
        ParamByName('Chosen_Smeta').AsInteger := Smeta2.Value;
        ParamByName('Split_Smeta').AsInteger := Smeta.Value;
        ParamByName('Chosen_Raise').AsInteger := IdRaise.Value;


        NagScreen := TNagScreen.Create(Self);
        NagScreen.Show;
        NagScreen.SetStatusText('Розбивка по джерелах фінансування...');
        try
            Transaction.StartTransaction;
            ExecQuery;
            Transaction.Commit;
        finally
            NagScreen.Free;
        end;
        ShowMessage('Розбивку завершено!');
    end;
end;

procedure TfmSmetaSplit.IdRaiseOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Data.DB.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Raise_Select_Kind'] := 0;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;

        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Raise'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

end.
