<template>
    <div class="card mb-12" style="max-width: 100%;">
    <div class="row g-0">
        <div class="col-md-3">
        <img
            :src="product.picture
                ? './storage/img/' + product.picture.split('/')[1]
                : '/img/cap.png'"
            :alt="product.title"
            style="width: 194px; height: 300px"
        />
        </div>
        <div class="col-md-9">
        <div class="card-body">
            <h4>
                {{product.title}}
            </h4>
            <p style="font-size: 1rem">
                {{product.description}}
            </p>
            <p class="card-text">
                <small class="text-muted">
                    {{product.price}} руб.
                </small>
            </p>
        </div>
        </div>
    </div>
    </div>
</template>

<script>

export default {
    props: ['product'],
}
</script>

<style scoped>
</style>