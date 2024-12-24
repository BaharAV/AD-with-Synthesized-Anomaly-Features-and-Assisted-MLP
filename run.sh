datapath=./MVTec_ad
datasets=('carpet' 'leather' 'cable' 'hazelnut' 'pill' 'toothbrush' 'capsule' 'grid' 'tile' 'wood' 'zipper' 'transistor' 'metal_nut' 'bottle' 'screw') #Med_2
dataset_flags=($(for dataset in "${datasets[@]}"; do echo '-d '"${dataset}"; done))

python main.py \
--gpu 0 \
--seed 0 \
--log_group cde_mvtec \
--log_project MVTecAD_Results_1 \
--results_path results_1 \
--run_name run \
net \
-b wideresnet50 \
-le layer2 \
-le layer3 \
--pretrain_embed_dimension 1536 \
--target_embed_dimension 1536 \
--patchsize 3 \
--meta_epochs 40 \
--embedding_size 256 \
--gan_epochs 4 \
--noise_std 0.015 \
--dsc_hidden 1024 \
--dsc_layers 2 \
--dsc_margin .5 \
--pre_proj 1 \
dataset \
--batch_size 8 \
--resize 329 \
--imagesize 288 "${dataset_flags[@]}" mvtec $datapath
