unit HF_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, dxBar, dxBarExtItems, uCommonSp,
  RXMemDS, IBase, DB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, cxContainer, cxCheckBox, StdCtrls,
  ExtCtrls, Placemnt, cxTextEdit, cxMemo, cxDBEdit, qFTools;

type
    THF_Main = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation

uses uUnivSprav;

function CreateSprav: TSprav;
begin
  Result := THF_Main.Create;
end;

constructor THF_Main.Create;
begin
  inherited Create;
 // создание входных/выходных полей
//  Input.FieldDefs.Add('DBHandle', ftInteger);
  Input.FieldDefs.Add('ShowMod', ftInteger);

  OutPut.FieldDefs.Add('Id_Man_Holiday_Fact', ftVariant);
  OutPut.FieldDefs.Add('holiday_beg', ftDate);
  OutPut.FieldDefs.Add('holiday_end', ftDate);
  OutPut.FieldDefs.Add('full_name', ftString, 255);

 // подготовить параметры
  PrepareMemoryDatasets;
end;

procedure THF_Main.Show;
var
  sp: TSprav;
  id_pcard : variant;
  FCaption : string;
  Params:TUnivParams;
  OutData : TRxMemoryData;
begin
  id_pcard := null;
  if VarIsNull(Input['ShowMod'])or(Input['ShowMod']=0)
   then repeat
     sp := GetSprav('asup\PCardsList');
     if sp <> nil
      then begin
        with sp.Input do
        begin
          Append;
          FieldValues['DBHandle']   := Input['DBHandle'];
          FieldValues['ActualDate'] := Date;
          FieldValues['AdminMode']  := 0;
          FieldValues['Select']     := 1;
          FieldValues['ShowStyle']  := 0;

          if FindField('NewVersion')<>nil
          then begin
                    FieldValues['NewVersion'] := 1;
          end;
          Post;
        end;
        sp.Show;

        if ( sp.Output <> nil ) and not sp.Output.IsEmpty
        then begin
          id_pcard := sp.Output['ID_PCARD'];
          FCaption := sp.Output['FIO'];
        end;
      end;

     if VarIsNull(id_pcard) and not(qFConfirm('Спочатку необхідно обрати особистку картку!'+#10#13+'Бажаєте продовжити?'))
      then Exit;
   until not VarIsNull(id_pcard);

  Params.FormCaption:='Довідник фактичних відпусток';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.TableName:='HL_DT_MAN_HOLIDAY_F_SEL_BY_PC('+IntToStr(Id_pcard)+')';
  Params.Fields:='NAME_POST,NAME_TYPE_HOLIDAY,HOLIDAY_BEG,HOLIDAY_END,FIO_TN,FULL_NAME,Id_Man_Holiday_Fact';
  Params.FieldsName:='~*Посада:,Відпустка,Початок,Кінець';
  Params.KeyField:='ID_MAN_HOLIDAY_FACT';
  Params.ReturnFields:='ID_MAN_HOLIDAY_FACT,FULL_NAME,HOLIDAY_BEG,HOLIDAY_END';
  Params.DBHandle:=Input['DBHandle'];

  OutData:=TRxMemoryData.Create(Application.MainForm);

  if GetUnivSprav(Params,OutData)
  then begin
    with OutPut do
    begin
      Append;
      OutPut['Id_Man_Holiday_Fact']:=OutData['Id_Man_Holiday_Fact'];
      OutPut['holiday_beg']        :=OutData['holiday_beg'];
      OutPut['holiday_end']        :=OutData['holiday_end'];
      OutPut['full_name']          :=OutData['full_name'];
      Post;
    end;
  end;
end;

end.
