PY=python3
PY_SRC=src/heatmap_generator.py

RESULTS=mkdir -p results/
DATA=mkdir -p data/

RESULTS_DIR=results/
DATA_DIR=data/

DOWN_ZIP_URL=https://physionet.org/static/published-projects/pmd/a-pressure-map-dataset-for-in-bed-posture-classification-1.0.0.zip
DOWN_ZIP=data/dataset.zip

ZIP=orientation_dataset.zip

all: download maps dataset

download:
	@$(DATA)
	@curl $(DOWN_ZIP_URL) >> $(DOWN_ZIP)
	@unzip $(DOWN_ZIP) -d data/
	@rm $(DOWN_ZIP)

maps : $(PY_SRC)
	@$(RESULTS)
	$(PY) $(PY_SRC)

dataset:
	@cd $(RESULTS_DIR); zip -r $(ZIP) *; cd ..

clean:
	rm -rf results/*
